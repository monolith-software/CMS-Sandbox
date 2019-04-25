<?php

declare(strict_types=1);

use Monolith\Bundle\CMSBundle\CMSAppKernel;

class AppKernel extends CMSAppKernel
{
    /**
     * Если в папке /src/ находится более одного сайт бандла, то необходимо явно указать какой будет использоваться.
     * Также явное указание, слегка увеличивает производительность.
     */
    //protected $siteName = 'My';

    /**
     * @return \Symfony\Component\HttpKernel\Bundle\BundleInterface[]
     */
    public function registerBundles(): array
    {
        $bundles = [
            //new Dizda\CloudBackupBundle\DizdaCloudBackupBundle(),
            new SmartCore\Bundle\SitemapBundle\SmartSitemapBundle(),

            new AppBundle\AppBundle(),
        ];

        $this->registerMonolithCmsBundles($bundles);

        return $bundles;
    }
}
