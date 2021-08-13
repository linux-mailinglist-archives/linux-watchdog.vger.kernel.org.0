Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3212D3EBE51
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 Aug 2021 00:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235079AbhHMWiB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Aug 2021 18:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235029AbhHMWiA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Aug 2021 18:38:00 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C36C061756;
        Fri, 13 Aug 2021 15:37:33 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 108-20020a9d01750000b029050e5cc11ae3so13852431otu.5;
        Fri, 13 Aug 2021 15:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DT0/vxmbAJwAeOyWkiqtK4FLlJ7NKSI34Eem1KdI/ro=;
        b=iK7kupQfTMxFWL9qkEDCc3xFChXDj98Z6C37B46f0EsuP83VG8PehTXwsL8YeA8RTx
         gn6BTqOdfOYaBMm2qfWb3enVIt+eHlbsY9hBzdXuq1BbkwYR4yCTbpbzLtpcFs87fEE6
         4QYocYJfgE63DYEtvPbQQfgANmQY6mObFHDkQfLNyFkWdUslOmfzAApDUfx5AY4mKRHh
         nSv9nBK59lrigYBl3EpWz2Vu3OgeSRFKXt899tk/d8qLOwk5hhZIS60VdFmRB4PwiMsW
         ZuQaUum1EkiyolRE+jZB2PK6kX1JVJeK+Xx2ZiCSihRbSJsg2GDtmh3rl8VaYy7c3d8L
         KCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DT0/vxmbAJwAeOyWkiqtK4FLlJ7NKSI34Eem1KdI/ro=;
        b=lMkNLgL1lzUdzhTUR/HClFJAgsZnns35fGARJ/YIS3TaWTyU0sgMYdctP/ps8aaQ6c
         +xIjHxZxoSvfCH/DvZVT0yH3OH8bFDL0qb3KMJcJVn+OcJpIrP0WHapRBrA6RKPZdS6V
         Cryk5+YVklpnJAGokjerZ53QC0UWHh4c1GTfvyrl0qC6VtsquWXcy9FMQX7chCcdf88L
         HfkUO4D6okWlCuZzPddrQOQwQQ3LBVghx62qSwf2/B94xdLUBZQCps8bURazKl1kb2g/
         TBGZjyEMLnpkvIbKUUnUXGJ1sjAVW/6zvnr+ObqycTj9puoKIR3/S+cGMGhU8B6ctcYn
         lHJg==
X-Gm-Message-State: AOAM531LlUlUWrIUATDfFhuGPO+w/UnX2m6DTaHcUfwIt21vM1O01GBB
        ahirLz1WHl0L20BsGuhYZFc=
X-Google-Smtp-Source: ABdhPJw5+TFfCl9vihJtj/biVdQRZkIk5irww+yH9yQapbIPTz121iWMbnVO6+p3WB9iN1qBh2e3Ng==
X-Received: by 2002:a05:6830:138d:: with SMTP id d13mr3799706otq.311.1628894252999;
        Fri, 13 Aug 2021 15:37:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w66sm590744otb.15.2021.08.13.15.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 15:37:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] Watchdog: sp5100_tco: Replace watchdog cd6h/cd7h port I/O
 accesses with MMIO accesses
To:     Terry Bowman <Terry.Bowman@amd.com>, linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        rrichter@amd.com
References: <20210813213216.54780-1-Terry.Bowman@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <416a67a7-646b-eb8d-b617-80cbbbc028c6@roeck-us.net>
Date:   Fri, 13 Aug 2021 15:37:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813213216.54780-1-Terry.Bowman@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/13/21 2:32 PM, Terry Bowman wrote:
> Use MMIO instead of port I/O during SMBus controller address discovery.
> Also, update how EFCH capability is determined by replacing a family check
> with a PCI revision ID check.
> 
> cd6h/cd7h port I/O can be disabled on recent AMD hardware. Read accesses to
> disabled cd6h/cd7h port I/O will return F's and written data is dropped.
> The recommended workaround to handle disabled cd6h/cd7h port I/O is
> replacing port I/O with MMIO accesses. The MMIO access method has been
> available since at least SMBus controllers using PCI revision 0x59.
> 
> The sp5100_tco driver uses a CPU family match of 17h to determine
> EFCH_PM_DECODEEN_WDT_TMREN register support. Using a family check requires
> driver updates for each new AMD CPU family following 17h. This patch
> replaces the family check with a check for SMBus PCI revision ID 0x59 and
> later. Note: Family 17h processors use SMBus PCI revision ID 0x59. The
> intent is to use the PCI revision ID check to support future AMD processors
> while minimizing required driver changes. The caveat with this change is
> the sp5100_tco driver must be updated if a new AMD processor family changes
> the EFCH design or the SMBus PCI ID value doesn't follow this pattern.
> 
> Tested with forced WDT reset using `cat >> /dev/watchdog`.
> 

I am sorry, I don't understand why the new code can not use devm functions,
why the new data structure is necessary in the first place, and why it is
not possible to improve alignment with the existing code. This will require
a substantial amount of time to review to ensure that the changes are not
excessive (at first glance it for sure looks like that to me).

Guenter

> Signed-off-by: Terry Bowman <Terry.Bowman@amd.com>
> Reviewed-by: Robert Richter <rrichter@amd.com>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-kernel@vger.kernel.org
> ---
>   drivers/watchdog/sp5100_tco.c | 180 +++++++++++++++++++++++++++-------
>   drivers/watchdog/sp5100_tco.h |   5 +
>   2 files changed, 148 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
> index a730ecbf78cd..cf1d0d96a731 100644
> --- a/drivers/watchdog/sp5100_tco.c
> +++ b/drivers/watchdog/sp5100_tco.c
> @@ -44,6 +44,7 @@
>   #include "sp5100_tco.h"
>   
>   #define TCO_DRIVER_NAME	"sp5100-tco"
> +#define AMD_PCI_SMBUS_REVISION_MMIO             0x59
>   
>   /* internal variables */
>   
> @@ -51,6 +52,11 @@ enum tco_reg_layout {
>   	sp5100, sb800, efch
>   };
>   
> +struct efch_cfg {
> +	void __iomem *addr;
> +	struct resource *res;
> +};
> +
>   struct sp5100_tco {
>   	struct watchdog_device wdd;
>   	void __iomem *tcobase;
> @@ -161,7 +167,133 @@ static void sp5100_tco_update_pm_reg8(u8 index, u8 reset, u8 set)
>   	outb(val, SP5100_IO_PM_DATA_REG);
>   }
>   
> -static void tco_timer_enable(struct sp5100_tco *tco)
> +static bool efch_use_mmio(void)
> +{
> +	return (sp5100_tco_pci->vendor == PCI_VENDOR_ID_AMD &&
> +		sp5100_tco_pci->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS &&
> +		sp5100_tco_pci->revision >= AMD_PCI_SMBUS_REVISION_MMIO);
> +}
> +
> +static u8 efch_read_pm_reg8(struct efch_cfg *cfg, u8 index)
> +{
> +	if (!cfg->addr)
> +		return sp5100_tco_read_pm_reg8(index);
> +
> +	return readb(cfg->addr + index);
> +}
> +
> +static void efch_update_pm_reg8(struct efch_cfg *cfg,
> +				u8 index, u8 reset, u8 set)
> +{
> +	u8 val;
> +
> +	if (!cfg->addr) {
> +		sp5100_tco_update_pm_reg8(index, reset, set);
> +		return;
> +	}
> +
> +	val = readb(cfg->addr + index);
> +	val &= reset;
> +	val |= set;
> +	writeb(val, cfg->addr + index);
> +}
> +
> +/* Return SMBus controller's MMIO address on success and 0 on error. */
> +static u32 efch_setup_mmio_addr(struct efch_cfg *cfg)
> +{
> +	/*
> +	 * On EFCH devices, the EFCH_PM_DECODEEN_WDT_TMREN bit of
> +	 * EFCH_PM_DECODEEN not only enables the EFCH_PM_WDT_ADDR memory
> +	 * region, it also enables the watchdog itself.
> +	 * If mmio is enbaled then the WDT needs to be started if not
> +	 * already started.
> +	 */
> +	if (cfg->addr) {
> +		if (!(efch_read_pm_reg8(cfg, EFCH_PM_DECODEEN) &
> +		      EFCH_PM_DECODEEN_WDT_TMREN)) {
> +			efch_update_pm_reg8(cfg, EFCH_PM_DECODEEN,
> +					    0xff,
> +					    EFCH_PM_DECODEEN_WDT_TMREN);
> +		}
> +	}
> +
> +	if (!(efch_read_pm_reg8(cfg, EFCH_PM_DECODEEN) &
> +	      EFCH_PM_DECODEEN_WDT_TMREN))
> +		return 0;
> +
> +	return EFCH_PM_WDT_ADDR;
> +}
> +
> +/*
> + * Return SMBus controller's alternate MMIO address on success and 0 on
> + * error.
> + *
> + * The alternate SMBus MMIO address is necessary if the address
> + * returned from efch_setup_mmio_addr() is unreadable or the space
> + * reservation fails.
> + */
> +static u32 efch_setup_alt_mmio_addr(struct efch_cfg *cfg)
> +{
> +	if (!(efch_read_pm_reg8(cfg, EFCH_PM_ISACONTROL) &
> +	      EFCH_PM_ISACONTROL_MMIOEN))
> +		return 0;
> +
> +	return EFCH_PM_ACPI_MMIO_ADDR + EFCH_PM_ACPI_MMIO_WDT_OFFSET;
> +}
> +
> +static int sp5100_region_setup(struct device *dev, struct efch_cfg *cfg)
> +{
> +	if (efch_use_mmio()) {
> +		struct resource *res;
> +		void __iomem *addr;
> +
> +		res = request_mem_region(EFCH_PM_ACPI_MMIO_PM_ADDR,
> +					 EFCH_PM_ACPI_MMIO_PM_SIZE,
> +					 "sp5100_tco");
> +		if (!res) {
> +			dev_err(dev,
> +				"SMB base address memory region 0x%x already in use.\n",
> +				EFCH_PM_ACPI_MMIO_PM_ADDR);
> +			return -EBUSY;
> +		}
> +
> +		addr = ioremap(EFCH_PM_ACPI_MMIO_PM_ADDR,
> +			       EFCH_PM_ACPI_MMIO_PM_SIZE);
> +		if (!addr) {
> +			release_resource(res);
> +			dev_err(dev, "SMB base address mapping failed.\n");
> +			return -ENOMEM;
> +		}
> +
> +		cfg->res = res;
> +		cfg->addr = addr;
> +		return 0;
> +	}
> +
> +	/* Request the IO ports used by this driver */
> +	if (!request_muxed_region(SP5100_IO_PM_INDEX_REG,
> +				  SP5100_PM_IOPORTS_SIZE, "sp5100_tco")) {
> +		dev_err(dev, "I/O address 0x%04x already in use\n",
> +			SP5100_IO_PM_INDEX_REG);
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
> +static void sp5100_region_release(struct efch_cfg *cfg)
> +{
> +	if (!cfg->addr) {
> +		release_region(SP5100_IO_PM_INDEX_REG,
> +			       SP5100_PM_IOPORTS_SIZE);
> +		return;
> +	}
> +
> +	iounmap(cfg->addr);
> +	release_resource(cfg->res);
> +}
> +
> +static void tco_timer_enable(struct sp5100_tco *tco, struct efch_cfg *cfg)
>   {
>   	u32 val;
>   
> @@ -197,9 +326,9 @@ static void tco_timer_enable(struct sp5100_tco *tco)
>   		break;
>   	case efch:
>   		/* Set the Watchdog timer resolution to 1 sec and enable */
> -		sp5100_tco_update_pm_reg8(EFCH_PM_DECODEEN3,
> -					  ~EFCH_PM_WATCHDOG_DISABLE,
> -					  EFCH_PM_DECODEEN_SECOND_RES);
> +		efch_update_pm_reg8(cfg, EFCH_PM_DECODEEN3,
> +				    ~EFCH_PM_WATCHDOG_DISABLE,
> +				    EFCH_PM_DECODEEN_SECOND_RES);
>   		break;
>   	}
>   }
> @@ -219,17 +348,14 @@ static int sp5100_tco_setupdevice(struct device *dev,
>   				  struct watchdog_device *wdd)
>   {
>   	struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
> +	struct efch_cfg cfg = {0};
>   	const char *dev_name;
> -	u32 mmio_addr = 0, val;
> +	u32 mmio_addr, val;
>   	int ret;
>   
> -	/* Request the IO ports used by this driver */
> -	if (!request_muxed_region(SP5100_IO_PM_INDEX_REG,
> -				  SP5100_PM_IOPORTS_SIZE, "sp5100_tco")) {
> -		dev_err(dev, "I/O address 0x%04x already in use\n",
> -			SP5100_IO_PM_INDEX_REG);
> -		return -EBUSY;
> -	}
> +	ret = sp5100_region_setup(dev, &cfg);
> +	if (ret)
> +		return ret;
>   
>   	/*
>   	 * Determine type of southbridge chipset.
> @@ -247,21 +373,7 @@ static int sp5100_tco_setupdevice(struct device *dev,
>   		break;
>   	case efch:
>   		dev_name = SB800_DEVNAME;
> -		/*
> -		 * On Family 17h devices, the EFCH_PM_DECODEEN_WDT_TMREN bit of
> -		 * EFCH_PM_DECODEEN not only enables the EFCH_PM_WDT_ADDR memory
> -		 * region, it also enables the watchdog itself.
> -		 */
> -		if (boot_cpu_data.x86 == 0x17) {
> -			val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
> -			if (!(val & EFCH_PM_DECODEEN_WDT_TMREN)) {
> -				sp5100_tco_update_pm_reg8(EFCH_PM_DECODEEN, 0xff,
> -							  EFCH_PM_DECODEEN_WDT_TMREN);
> -			}
> -		}
> -		val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
> -		if (val & EFCH_PM_DECODEEN_WDT_TMREN)
> -			mmio_addr = EFCH_PM_WDT_ADDR;
> +		mmio_addr = efch_setup_mmio_addr(&cfg);
>   		break;
>   	default:
>   		return -ENODEV;
> @@ -307,13 +419,11 @@ static int sp5100_tco_setupdevice(struct device *dev,
>   			mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
>   			break;
>   		case efch:
> -			val = sp5100_tco_read_pm_reg8(EFCH_PM_ISACONTROL);
> -			if (!(val & EFCH_PM_ISACONTROL_MMIOEN)) {
> +			mmio_addr = efch_setup_alt_mmio_addr(&cfg);
> +			if (!mmio_addr) {
>   				ret = -ENODEV;
>   				goto unreg_region;
>   			}
> -			mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
> -				    EFCH_PM_ACPI_MMIO_WDT_OFFSET;
>   			break;
>   		}
>   		dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n",
> @@ -338,7 +448,7 @@ static int sp5100_tco_setupdevice(struct device *dev,
>   	dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", mmio_addr);
>   
>   	/* Setup the watchdog timer */
> -	tco_timer_enable(tco);
> +	tco_timer_enable(tco, &cfg);
>   
>   	val = readl(SP5100_WDT_CONTROL(tco->tcobase));
>   	if (val & SP5100_WDT_DISABLED) {
> @@ -366,12 +476,8 @@ static int sp5100_tco_setupdevice(struct device *dev,
>   	 */
>   	tco_timer_stop(wdd);
>   
> -	release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
> -
> -	return 0;
> -
>   unreg_region:
> -	release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
> +	sp5100_region_release(&cfg);
>   	return ret;
>   }
>   
> diff --git a/drivers/watchdog/sp5100_tco.h b/drivers/watchdog/sp5100_tco.h
> index adf015aa4126..2df8f8b2c55b 100644
> --- a/drivers/watchdog/sp5100_tco.h
> +++ b/drivers/watchdog/sp5100_tco.h
> @@ -83,3 +83,8 @@
>   
>   #define EFCH_PM_ACPI_MMIO_ADDR		0xfed80000
>   #define EFCH_PM_ACPI_MMIO_WDT_OFFSET	0x00000b00
> +#define EFCH_PM_ACPI_MMIO_PM_OFFSET	0x00000300
> +
> +#define EFCH_PM_ACPI_MMIO_PM_ADDR	(EFCH_PM_ACPI_MMIO_ADDR +	\
> +					 EFCH_PM_ACPI_MMIO_PM_OFFSET)
> +#define EFCH_PM_ACPI_MMIO_PM_SIZE       8
> 

