Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903963A1E24
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Jun 2021 22:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhFIUe0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Jun 2021 16:34:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:33674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229517AbhFIUe0 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Jun 2021 16:34:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0407461354;
        Wed,  9 Jun 2021 20:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623270751;
        bh=cwN1ib5e//5k0TeRbpqXnirj82rEAs0iDe99zClbmEk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=sXbT756GWk7nw2Z7clgWCHP5IScIdjBj7/XNuW8X8bOUZlyBVpVoXGWiwBsm3+kB9
         a0MJgT+5967prN4B+Y6A/X5h8qF7JQ673U5/LzUtSuNt6Y87OUiVLQim6Zm70E85tY
         StanHUZofak7dTls8zGSPpA0zeuioWtQtqlJz8bCSg7Cb+mt68jwuWbl6jiR+ZiEVt
         EneLoNcjwRNNah1+nOQBhDqEbYvb0ZaKkpj+TGQSuAmiPS/BtvBhdRk7Ss4vVLub8J
         CctAF2jY9gmISQMvF9LXc1PufB/lv2nR0+kIJsiOretQ3GqzdV9OSmivk46mwbRI7L
         YnZgvW/dfx3+Q==
Date:   Wed, 9 Jun 2021 15:32:29 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/3] watchdog: iTCO_wdt: use dev_*() instead of pr_*()
 for logging
Message-ID: <20210609203229.GA2664456@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117152214.32244-2-info@metux.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Nov 17, 2020 at 04:22:13PM +0100, Enrico Weigelt, metux IT consult wrote:
> For device log outputs, it's better to have device name / ID
> prefixed in all messages, so use the proper dev_*() functions here.
> 
> Explicit message on module load/unload don't seem to be really helpful
> (we have other means to check which modules have been loaded), instead
> just add noise to the kernel log. So, removing them.
> 
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

I like this patch a lot; thanks for doing it!  It's merged upstream as
c21172b3a73e ("watchdog: iTCO_wdt: use dev_*() instead of pr_*() for
logging").

It looks like there are a couple more pr_err() uses, so I wondered if
they were missed or skipped intentionally:

  if (p->smi_res) {
          /* The TCO logic uses the TCO_EN bit in the SMI_EN register */
          if (!devm_request_region(dev, p->smi_res->start,
                                   resource_size(p->smi_res),
                                   pdev->name)) {
                  pr_err("I/O address 0x%04llx already in use, device disabled\n",
                         (u64)SMI_EN(p));
                  return -EBUSY;
          }
  } else if (iTCO_vendorsupport ||
             turn_SMI_watchdog_clear_off >= p->iTCO_version) {
          pr_err("SMI I/O resource is missing\n");
          return -ENODEV;
  }

> ---
>  drivers/watchdog/iTCO_wdt.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index f2ddc8fc71cd..edc588a06ae6 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -40,8 +40,6 @@
>   *	Includes, defines, variables, module parameters, ...
>   */
>  
> -#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> -
>  /* Module and version information */
>  #define DRV_NAME	"iTCO_wdt"
>  #define DRV_VERSION	"1.11"
> @@ -279,7 +277,7 @@ static int iTCO_wdt_start(struct watchdog_device *wd_dev)
>  	/* disable chipset's NO_REBOOT bit */
>  	if (p->update_no_reboot_bit(p->no_reboot_priv, false)) {
>  		spin_unlock(&p->io_lock);
> -		pr_err("failed to reset NO_REBOOT flag, reboot disabled by hardware/BIOS\n");
> +		dev_err(wd_dev->dev, "failed to reset NO_REBOOT flag, reboot disabled by hardware/BIOS\n");
>  		return -EIO;
>  	}
>  
> @@ -510,7 +508,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  	/* Check chipset's NO_REBOOT bit */
>  	if (p->update_no_reboot_bit(p->no_reboot_priv, false) &&
>  	    iTCO_vendor_check_noreboot_on()) {
> -		pr_info("unable to reset NO_REBOOT flag, device disabled by hardware/BIOS\n");
> +		dev_info(dev, "unable to reset NO_REBOOT flag, device disabled by hardware/BIOS\n");
>  		return -ENODEV;	/* Cannot reset NO_REBOOT bit */
>  	}
>  
> @@ -530,12 +528,12 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  	if (!devm_request_region(dev, p->tco_res->start,
>  				 resource_size(p->tco_res),
>  				 pdev->name)) {
> -		pr_err("I/O address 0x%04llx already in use, device disabled\n",
> +		dev_err(dev, "I/O address 0x%04llx already in use, device disabled\n",
>  		       (u64)TCOBASE(p));
>  		return -EBUSY;
>  	}
>  
> -	pr_info("Found a %s TCO device (Version=%d, TCOBASE=0x%04llx)\n",
> +	dev_info(dev, "Found a %s TCO device (Version=%d, TCOBASE=0x%04llx)\n",
>  		pdata->name, pdata->version, (u64)TCOBASE(p));
>  
>  	/* Clear out the (probably old) status */
> @@ -558,7 +556,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  		break;
>  	}
>  
> -	p->wddev.info =	&ident,
> +	p->wddev.info = &ident,
>  	p->wddev.ops = &iTCO_wdt_ops,
>  	p->wddev.bootstatus = 0;
>  	p->wddev.timeout = WATCHDOG_TIMEOUT;
> @@ -575,7 +573,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  	   if not reset to the default */
>  	if (iTCO_wdt_set_timeout(&p->wddev, heartbeat)) {
>  		iTCO_wdt_set_timeout(&p->wddev, WATCHDOG_TIMEOUT);
> -		pr_info("timeout value out of range, using %d\n",
> +		dev_info(dev, "timeout value out of range, using %d\n",
>  			WATCHDOG_TIMEOUT);
>  	}
>  
> @@ -583,11 +581,11 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  	watchdog_stop_on_unregister(&p->wddev);
>  	ret = devm_watchdog_register_device(dev, &p->wddev);
>  	if (ret != 0) {
> -		pr_err("cannot register watchdog device (err=%d)\n", ret);
> +		dev_err(dev, "cannot register watchdog device (err=%d)\n", ret);
>  		return ret;
>  	}
>  
> -	pr_info("initialized. heartbeat=%d sec (nowayout=%d)\n",
> +	dev_info(dev, "initialized. heartbeat=%d sec (nowayout=%d)\n",
>  		heartbeat, nowayout);
>  
>  	return 0;
> -- 
> 2.11.0
> 
