Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4CBCE7E4
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Apr 2019 18:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbfD2Qhu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Apr 2019 12:37:50 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41996 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728645AbfD2Qht (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Apr 2019 12:37:49 -0400
Received: by mail-pg1-f194.google.com with SMTP id p6so5399341pgh.9
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Apr 2019 09:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WpkL+MwJU4sjauaOasA4o0lDofqZQ9PXwTJtcjBELCE=;
        b=c4pmJkughJtKMbG82Op37o5uaG5AA7v6xoLkwFowBi52JltQk+heFnqpLV1e9aX+aN
         y69iCoCxdcAW18xXkPtunjlBiGm0ltD8v/gmh9rGMyWQzOXxTLKBr+Zp1fEX3Ui0/jZm
         kLmHIp5yuPFwtZzm0YLHSKocvpnNaWF0T0/8/RiTOQ98uk19CDZ6dhuJD2qHASG7N8sX
         uTyJv+1lHj+JVSEcBH4Q9Zd7b8IUO/2oZiZaCpSq3oLYmWkKu5hs/b+LC0+htCi7PM2I
         w5yVEh67YFGwIBY1BX5Cfv6brJutv/y/YIygMe58uaJbgQ/6B7AIN8PDOYDa4/raDIrT
         BEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=WpkL+MwJU4sjauaOasA4o0lDofqZQ9PXwTJtcjBELCE=;
        b=uBoi3L9Nkynd65kjRoImVjCDBLdABczfmUQutM7tjMKEzs8rPiMQWY6uhh0HPu4UoH
         KeFLHIO/LjSODmvoRxAa6iC/E0MXdHVAKCw6U55sp9v7a9rY+1sij5pw71TfJcTaV7t6
         9mPbf2SyTrNjDWzAngu3YcuamBzrruc3qXbjDn4gncsDfU8uvOKuJUYzPI+0BfE7xqf0
         M3pGzU5C+ML9b4HMKbxlajBNPv/AcgtMRItdFuoI1cNK7SidANFs1vL0mwVsnTeYttwA
         guKEcf3GsMIZMsnmSKMLvagfVkZf4DozhDUUL4ZuW8raMqVrhRp6Kxp0iYJx05wxYg4g
         Swdw==
X-Gm-Message-State: APjAAAX3X6BbuiW1LchWc1iCeqqOwZ2uU+V5tL9IQK1uKEvFdK/puMAL
        oMkTWLDfdUk2BFqGx8IMwm7LvOaf
X-Google-Smtp-Source: APXvYqzKssHJGlUIfF5bzZXAJr8UrkraTI/VOuv88ptTLFR5mIzXoTFr3Q/el6xEJjVISVFgEOlM0g==
X-Received: by 2002:a63:5014:: with SMTP id e20mr36051989pgb.312.1556555869265;
        Mon, 29 Apr 2019 09:37:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j12sm44502915pgg.79.2019.04.29.09.37.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 09:37:48 -0700 (PDT)
Date:   Mon, 29 Apr 2019 09:37:47 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Gortmaker <paul.gortmaker@windriver.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>
Subject: Re: [PATCH 4/5] watchdog: intel_scu: make it explicitly non-modular
Message-ID: <20190429163747.GA14186@roeck-us.net>
References: <1556034515-28792-1-git-send-email-paul.gortmaker@windriver.com>
 <1556034515-28792-5-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556034515-28792-5-git-send-email-paul.gortmaker@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Apr 23, 2019 at 11:48:34AM -0400, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> config INTEL_SCU_WATCHDOG
>        bool "Intel SCU Watchdog for Mobile Platforms"
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
> 
> We leave the moduleparam.h include since the file does declare some
> module parameters, and leaving them as such is currently the easiest
> way to remain compatible with existing boot arg use cases.
> 
> Cc: Wim Van Sebroeck <wim@iguana.be>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/intel_scu_watchdog.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/drivers/watchdog/intel_scu_watchdog.c b/drivers/watchdog/intel_scu_watchdog.c
> index 0caab6241eb7..32bc5611f0cc 100644
> --- a/drivers/watchdog/intel_scu_watchdog.c
> +++ b/drivers/watchdog/intel_scu_watchdog.c
> @@ -25,7 +25,6 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/compiler.h>
> -#include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/moduleparam.h>
>  #include <linux/types.h>
> @@ -545,21 +544,4 @@ static int __init intel_scu_watchdog_init(void)
>  	iounmap(watchdog_device.timer_load_count_addr);
>  	return ret;
>  }
> -
> -static void __exit intel_scu_watchdog_exit(void)
> -{
> -
> -	misc_deregister(&watchdog_device.miscdev);
> -	unregister_reboot_notifier(&watchdog_device.intel_scu_notifier);
> -	/* disable the timer */
> -	iowrite32(0x00000002, watchdog_device.timer_control_addr);
> -	iounmap(watchdog_device.timer_load_count_addr);
> -}
> -
>  late_initcall(intel_scu_watchdog_init);
> -module_exit(intel_scu_watchdog_exit);
> -
> -MODULE_AUTHOR("Intel Corporation");
> -MODULE_DESCRIPTION("Intel SCU Watchdog Device Driver");
> -MODULE_LICENSE("GPL");
> -MODULE_VERSION(WDT_VER);
