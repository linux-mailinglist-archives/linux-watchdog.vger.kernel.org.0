Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0AA3B4FCE
	for <lists+linux-watchdog@lfdr.de>; Sat, 26 Jun 2021 20:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhFZSTG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 26 Jun 2021 14:19:06 -0400
Received: from mga03.intel.com ([134.134.136.65]:24457 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230046AbhFZSTG (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 26 Jun 2021 14:19:06 -0400
IronPort-SDR: prJq7r1+XMAZR8VU3gpIR1kHBHidLh0dqZDvOmHxRyjAk/T2VC23ilw+/w2d3DfRT0B7tgohCw
 3XV9qetHGjfA==
X-IronPort-AV: E=McAfee;i="6200,9189,10027"; a="207838717"
X-IronPort-AV: E=Sophos;i="5.83,302,1616482800"; 
   d="scan'208";a="207838717"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2021 11:16:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,302,1616482800"; 
   d="scan'208";a="491898075"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga002.fm.intel.com with ESMTP; 26 Jun 2021 11:16:42 -0700
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sat, 26 Jun 2021 11:16:41 -0700
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 HASMSX602.ger.corp.intel.com (10.184.107.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sat, 26 Jun 2021 21:16:39 +0300
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.2242.008;
 Sat, 26 Jun 2021 21:16:39 +0300
From:   "Winkler, Tomas" <tomas.winkler@intel.com>
To:     Jinchao Wang <wjc@cdjrlc.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: RE: [PATCH] watchdog: Replace symbolic permissions with octal
 permissions
Thread-Topic: [PATCH] watchdog: Replace symbolic permissions with octal
 permissions
Thread-Index: AQHXanNnnh/DveEuoE+7tRq0pv1lN6smmbMw
Date:   Sat, 26 Jun 2021 18:16:39 +0000
Message-ID: <46c74dfb182e4fd880ed4b9759a586eb@intel.com>
References: <20210626100922.54218-1-wjc@cdjrlc.com>
In-Reply-To: <20210626100922.54218-1-wjc@cdjrlc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.184.70.1]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> Subject: [PATCH] watchdog: Replace symbolic permissions with octal
> permissions
> 
> Resolve following checkpatch issue,
> Replace symbolic permissions with octal permissions


Ack for mei_wdt.c 

> Signed-off-by: Jinchao Wang <wjc@cdjrlc.com>
> ---
>  drivers/watchdog/mei_wdt.c     | 4 ++--
>  drivers/watchdog/ni903x_wdt.c  | 2 +-
>  drivers/watchdog/sbsa_gwdt.c   | 2 +-
>  drivers/watchdog/sun4v_wdt.c   | 2 +-
>  drivers/watchdog/xen_wdt.c     | 4 ++--
>  drivers/watchdog/ziirave_wdt.c | 8 ++++----
>  6 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/watchdog/mei_wdt.c b/drivers/watchdog/mei_wdt.c
> index c7a7235e6224..3ee5b9e83c7e 100644
> --- a/drivers/watchdog/mei_wdt.c
> +++ b/drivers/watchdog/mei_wdt.c
> @@ -545,9 +545,9 @@ static void dbgfs_register(struct mei_wdt *wdt)
>  	dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
>  	wdt->dbgfs_dir = dir;
> 
> -	debugfs_create_file("state", S_IRUSR, dir, wdt, &dbgfs_fops_state);
> +	debugfs_create_file("state", 0400, dir, wdt, &dbgfs_fops_state);
> 
> -	debugfs_create_file("activation", S_IRUSR, dir, wdt,
> +	debugfs_create_file("activation", 0400, dir, wdt,
>  			    &dbgfs_fops_activation);
>  }
> 
> diff --git a/drivers/watchdog/ni903x_wdt.c
> b/drivers/watchdog/ni903x_wdt.c index 4cebad324b20..4d85082e0ce9
> 100644
> --- a/drivers/watchdog/ni903x_wdt.c
> +++ b/drivers/watchdog/ni903x_wdt.c
> @@ -48,7 +48,7 @@ MODULE_PARM_DESC(timeout,
>  		 __MODULE_STRING(NIWD_DEFAULT_TIMEOUT) ")");
> 
>  static int nowayout = WATCHDOG_NOWAYOUT; -module_param(nowayout,
> int, S_IRUGO);
> +module_param(nowayout, int, 0444);
>  MODULE_PARM_DESC(nowayout,
>  		 "Watchdog cannot be stopped once started (default="
>  		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")"); diff --
> git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c index
> ee9ff38929eb..369d2f922ecc 100644
> --- a/drivers/watchdog/sbsa_gwdt.c
> +++ b/drivers/watchdog/sbsa_gwdt.c
> @@ -112,7 +112,7 @@ MODULE_PARM_DESC(action, "after watchdog gets
> WS0 interrupt, do: "
>  		 "0 = skip(*)  1 = panic");
> 
>  static bool nowayout = WATCHDOG_NOWAYOUT; -
> module_param(nowayout, bool, S_IRUGO);
> +module_param(nowayout, bool, 0444);
>  MODULE_PARM_DESC(nowayout,
>  		 "Watchdog cannot be stopped once started (default="
>  		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")"); diff --
> git a/drivers/watchdog/sun4v_wdt.c b/drivers/watchdog/sun4v_wdt.c index
> 8db86ad5ee3d..22ee4b6093a2 100644
> --- a/drivers/watchdog/sun4v_wdt.c
> +++ b/drivers/watchdog/sun4v_wdt.c
> @@ -30,7 +30,7 @@ MODULE_PARM_DESC(timeout, "Watchdog timeout in
> seconds (default="
>  	__MODULE_STRING(WDT_TIMEOUT) ")");
> 
>  static bool nowayout = WATCHDOG_NOWAYOUT; -
> module_param(nowayout, bool, S_IRUGO);
> +module_param(nowayout, bool, 0444);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once
> started (default="
>  	__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> 
> diff --git a/drivers/watchdog/xen_wdt.c b/drivers/watchdog/xen_wdt.c
> index b343f421dc72..d9e8408ce60d 100644
> --- a/drivers/watchdog/xen_wdt.c
> +++ b/drivers/watchdog/xen_wdt.c
> @@ -28,12 +28,12 @@ static time64_t wdt_expires;
> 
>  #define WATCHDOG_TIMEOUT 60 /* in seconds */  static unsigned int
> timeout; -module_param(timeout, uint, S_IRUGO);
> +module_param(timeout, uint, 0444);
>  MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds "
>  	"(default=" __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
> 
>  static bool nowayout = WATCHDOG_NOWAYOUT; -
> module_param(nowayout, bool, S_IRUGO);
> +module_param(nowayout, bool, 0444);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once
> started "
>  	"(default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> 
> diff --git a/drivers/watchdog/ziirave_wdt.c
> b/drivers/watchdog/ziirave_wdt.c index c5a9b820d43a..aa6dcb604ab0
> 100644
> --- a/drivers/watchdog/ziirave_wdt.c
> +++ b/drivers/watchdog/ziirave_wdt.c
> @@ -451,7 +451,7 @@ static ssize_t ziirave_wdt_sysfs_show_firm(struct
> device *dev,
>  	return ret;
>  }
> 
> -static DEVICE_ATTR(firmware_version, S_IRUGO,
> ziirave_wdt_sysfs_show_firm,
> +static DEVICE_ATTR(firmware_version, 0444, ziirave_wdt_sysfs_show_firm,
>  		   NULL);
> 
>  static ssize_t ziirave_wdt_sysfs_show_boot(struct device *dev, @@ -475,7
> +475,7 @@ static ssize_t ziirave_wdt_sysfs_show_boot(struct device *dev,
>  	return ret;
>  }
> 
> -static DEVICE_ATTR(bootloader_version, S_IRUGO,
> ziirave_wdt_sysfs_show_boot,
> +static DEVICE_ATTR(bootloader_version, 0444,
> +ziirave_wdt_sysfs_show_boot,
>  		   NULL);
> 
>  static ssize_t ziirave_wdt_sysfs_show_reason(struct device *dev, @@ -
> 497,7 +497,7 @@ static ssize_t ziirave_wdt_sysfs_show_reason(struct device
> *dev,
>  	return ret;
>  }
> 
> -static DEVICE_ATTR(reset_reason, S_IRUGO,
> ziirave_wdt_sysfs_show_reason,
> +static DEVICE_ATTR(reset_reason, 0444, ziirave_wdt_sysfs_show_reason,
>  		   NULL);
> 
>  static ssize_t ziirave_wdt_sysfs_store_firm(struct device *dev, @@ -552,7
> +552,7 @@ static ssize_t ziirave_wdt_sysfs_store_firm(struct device *dev,
>  	return err ? err : count;
>  }
> 
> -static DEVICE_ATTR(update_firmware, S_IWUSR, NULL,
> +static DEVICE_ATTR(update_firmware, 0200, NULL,
>  		   ziirave_wdt_sysfs_store_firm);
> 
>  static struct attribute *ziirave_wdt_attrs[] = {
> --
> 2.31.1
> 
> 

