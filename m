Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB9D344688
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Mar 2021 15:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhCVOEU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Mar 2021 10:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbhCVOEK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Mar 2021 10:04:10 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5BF3C061574;
        Mon, 22 Mar 2021 07:04:09 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id o19-20020a9d22130000b02901bfa5b79e18so16024584ota.0;
        Mon, 22 Mar 2021 07:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bHnFjVoQfXSz1oFVB4tJDoK8rv54Gz8ZtmriCKacKz8=;
        b=VHttXh+ZT4SdNm+YN52BB5kTGs9yB7ICxxuYvx+DGvPTfwPwsLnbU1l553M4a1Suad
         qibRDil7WOB8tT0LseSY/M0NiVLOy9E0L7rP9sryDDInp6aDmTiaUzTkd5fiJ2Q20IXT
         cFyv3esTQ1jN7AuU/rLSfilKiFIptDUCC6kuD6f5RtJWqv1HLONetMV6fudl+o0T77vQ
         SWH/Qn15IpfXrmVSnbQM6y81AdK5C3K2GJheATGDau8TQGGgueJjPclyPqmIIo65Fo3/
         klBkYue24BEb6TwmCqBNG+/g9R6ae47C4Kh6TwlWfjUQ4fblPxe1D9g4OjfGA1qsYgip
         HVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bHnFjVoQfXSz1oFVB4tJDoK8rv54Gz8ZtmriCKacKz8=;
        b=bD0/Tjsth8pgh38hLKPDYAbZ+qQ3UqVrt4bXeUdIS7BkkJmbJvUGrOAeZRlImh+zh9
         NSfU6KIB6XA5nbG1bvWrVU5RpiF+e81hu4srKrrEuzwCrsSiDlfaIfEjRcgg4/TKkYjf
         8EXWZhCSfVU3009XU/eIeXoBmB1fA/BS05/4bw8GpUfh8Q1J7grjPop5cwQ9b+bhdNoU
         a4EOTRbTZ+ccXlRFfmjzWqD1Xau66Mf/5txQGrcjcsWFwVn0noNuOoKOcAg8J9NUhg7/
         VJ72Hn66CcCJiuXMwGYCe2rwPJxYcIYwopnxbRC3gxlUkI4EaxFBZfCc7urJzaJsZ2XK
         9htQ==
X-Gm-Message-State: AOAM531kvCjiS8eV7s4svGVDigMN3lhLOsSHrORDenMSm1RmZeFHbfiB
        Rmr8nOV5P6DzdKKmif3wxlsX8CpUy3Q=
X-Google-Smtp-Source: ABdhPJyyxsDy9sUcbpvXDFbR0rmwYReRNFu+VjgRBT6B8AUZdRRexLi1j3uT/uS9h/S9gpvB8lFH2w==
X-Received: by 2002:a9d:22e2:: with SMTP id y89mr103116ota.15.1616421848740;
        Mon, 22 Mar 2021 07:04:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w7sm3141204oie.7.2021.03.22.07.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 07:04:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: fix syntactic kernel-doc issues
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Cc:     Tomas Winkler <tomas.winkler@intel.com>, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210322065337.617-1-lukas.bulwahn@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <473d7675-f630-63e1-47b7-cefbb0b113e7@roeck-us.net>
Date:   Mon, 22 Mar 2021 07:04:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210322065337.617-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/21/21 11:53 PM, Lukas Bulwahn wrote:
> The command 'find drivers/watchdog | xargs ./scripts/kernel-doc -none'
> reports a number of kernel-doc warnings in the watchdog subsystem.
> 
> Address the kernel-doc warnings that were purely syntactic issues with
> kernel-doc comments.
> 
> The remaining kernel-doc warnings are of type "Excess function parameter"
> and "Function parameter or member not described". These warnings would
> need to be addressed in a second pass with a bit more insight into the
> APIs and purpose of the functions in the watchdog subsystem.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Guenter, Wim, please pick this minor clean-up patch.
> 
>  drivers/watchdog/booke_wdt.c       |  2 +-
>  drivers/watchdog/eurotechwdt.c     |  2 +-
>  drivers/watchdog/mei_wdt.c         |  8 ++++----
>  drivers/watchdog/octeon-wdt-main.c | 12 +++++++-----
>  drivers/watchdog/pc87413_wdt.c     |  2 +-
>  drivers/watchdog/wdt.c             |  4 ++--
>  drivers/watchdog/wdt_pci.c         |  2 +-
>  7 files changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/watchdog/booke_wdt.c b/drivers/watchdog/booke_wdt.c
> index 7817fb976f9c..5e4dc1a0f2c6 100644
> --- a/drivers/watchdog/booke_wdt.c
> +++ b/drivers/watchdog/booke_wdt.c
> @@ -148,7 +148,7 @@ static void __booke_wdt_enable(void *data)
>  }
>  
>  /**
> - * booke_wdt_disable - disable the watchdog on the given CPU
> + * __booke_wdt_disable - disable the watchdog on the given CPU
>   *
>   * This function is called on each CPU.  It disables the watchdog on that CPU.
>   *
> diff --git a/drivers/watchdog/eurotechwdt.c b/drivers/watchdog/eurotechwdt.c
> index 2418ebb707bd..ce682942662c 100644
> --- a/drivers/watchdog/eurotechwdt.c
> +++ b/drivers/watchdog/eurotechwdt.c
> @@ -392,7 +392,7 @@ static struct notifier_block eurwdt_notifier = {
>  };
>  
>  /**
> - * cleanup_module:
> + * eurwdt_exit:
>   *
>   * Unload the watchdog. You cannot do this with any file handles open.
>   * If your watchdog is set to continue ticking on close and you unload
> diff --git a/drivers/watchdog/mei_wdt.c b/drivers/watchdog/mei_wdt.c
> index e023d7d90d66..c7a7235e6224 100644
> --- a/drivers/watchdog/mei_wdt.c
> +++ b/drivers/watchdog/mei_wdt.c
> @@ -105,7 +105,7 @@ struct mei_wdt {
>  #endif /* CONFIG_DEBUG_FS */
>  };
>  
> -/*
> +/**
>   * struct mei_mc_hdr - Management Control Command Header
>   *
>   * @command: Management Control (0x2)
> @@ -121,7 +121,7 @@ struct mei_mc_hdr {
>  };
>  
>  /**
> - * struct mei_wdt_start_request watchdog start/ping
> + * struct mei_wdt_start_request - watchdog start/ping
>   *
>   * @hdr: Management Control Command Header
>   * @timeout: timeout value
> @@ -134,7 +134,7 @@ struct mei_wdt_start_request {
>  } __packed;
>  
>  /**
> - * struct mei_wdt_start_response watchdog start/ping response
> + * struct mei_wdt_start_response - watchdog start/ping response
>   *
>   * @hdr: Management Control Command Header
>   * @status: operation status
> @@ -474,7 +474,7 @@ static void mei_wdt_rx(struct mei_cl_device *cldev)
>  		complete(&wdt->response);
>  }
>  
> -/*
> +/**
>   * mei_wdt_notif - callback for event notification
>   *
>   * @cldev: bus device
> diff --git a/drivers/watchdog/octeon-wdt-main.c b/drivers/watchdog/octeon-wdt-main.c
> index fde9e739b436..298c070884c4 100644
> --- a/drivers/watchdog/octeon-wdt-main.c
> +++ b/drivers/watchdog/octeon-wdt-main.c
> @@ -119,7 +119,7 @@ static int cpu2core(int cpu)
>  }
>  
>  /**
> - * Poke the watchdog when an interrupt is received
> + * octeon_wdt_poke_irq - Poke the watchdog when an interrupt is received
>   *
>   * @cpl:
>   * @dev_id:
> @@ -153,7 +153,7 @@ static irqreturn_t octeon_wdt_poke_irq(int cpl, void *dev_id)
>  extern int prom_putchar(char c);
>  
>  /**
> - * Write a string to the uart
> + * octeon_wdt_write_string - Write a string to the uart
>   *
>   * @str:        String to write
>   */
> @@ -165,7 +165,7 @@ static void octeon_wdt_write_string(const char *str)
>  }
>  
>  /**
> - * Write a hex number out of the uart
> + * octeon_wdt_write_hex() - Write a hex number out of the uart
>   *
>   * @value:      Number to display
>   * @digits:     Number of digits to print (1 to 16)
> @@ -192,6 +192,8 @@ static const char reg_name[][3] = {
>  };
>  
>  /**
> + * octeon_wdt_nmi_stage3:
> + *
>   * NMI stage 3 handler. NMIs are handled in the following manner:
>   * 1) The first NMI handler enables CVMSEG and transfers from
>   * the bootbus region into normal memory. It is careful to not
> @@ -513,7 +515,7 @@ static struct watchdog_device octeon_wdt = {
>  
>  static enum cpuhp_state octeon_wdt_online;
>  /**
> - * Module/ driver initialization.
> + * octeon_wdt_init - Module/ driver initialization.
>   *
>   * Returns Zero on success
>   */
> @@ -585,7 +587,7 @@ static int __init octeon_wdt_init(void)
>  }
>  
>  /**
> - * Module / driver shutdown
> + * octeon_wdt_cleanup - Module / driver shutdown
>   */
>  static void __exit octeon_wdt_cleanup(void)
>  {
> diff --git a/drivers/watchdog/pc87413_wdt.c b/drivers/watchdog/pc87413_wdt.c
> index 2d4504302c9e..9f9a340427fc 100644
> --- a/drivers/watchdog/pc87413_wdt.c
> +++ b/drivers/watchdog/pc87413_wdt.c
> @@ -445,7 +445,7 @@ static long pc87413_ioctl(struct file *file, unsigned int cmd,
>  /* -- Notifier funtions -----------------------------------------*/
>  
>  /**
> - *	notify_sys:
> + *	pc87413_notify_sys:
>   *	@this: our notifier block
>   *	@code: the event being reported
>   *	@unused: unused
> diff --git a/drivers/watchdog/wdt.c b/drivers/watchdog/wdt.c
> index a9e40b5c633e..183876156243 100644
> --- a/drivers/watchdog/wdt.c
> +++ b/drivers/watchdog/wdt.c
> @@ -494,7 +494,7 @@ static int wdt_temp_release(struct inode *inode, struct file *file)
>  }
>  
>  /**
> - *	notify_sys:
> + *	wdt_notify_sys:
>   *	@this: our notifier block
>   *	@code: the event being reported
>   *	@unused: unused
> @@ -558,7 +558,7 @@ static struct notifier_block wdt_notifier = {
>  };
>  
>  /**
> - *	cleanup_module:
> + *	wdt_exit:
>   *
>   *	Unload the watchdog. You cannot do this with any file handles open.
>   *	If your watchdog is set to continue ticking on close and you unload
> diff --git a/drivers/watchdog/wdt_pci.c b/drivers/watchdog/wdt_pci.c
> index c3254ba5ace6..d5e56b601351 100644
> --- a/drivers/watchdog/wdt_pci.c
> +++ b/drivers/watchdog/wdt_pci.c
> @@ -537,7 +537,7 @@ static int wdtpci_temp_release(struct inode *inode, struct file *file)
>  }
>  
>  /**
> - *	notify_sys:
> + *	wdtpci_notify_sys:
>   *	@this: our notifier block
>   *	@code: the event being reported
>   *	@unused: unused
> 

