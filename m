Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC6FD3F2D5E
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Aug 2021 15:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235334AbhHTNqF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 Aug 2021 09:46:05 -0400
Received: from thoth.sbs.de ([192.35.17.2]:42417 "EHLO thoth.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232209AbhHTNqF (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 Aug 2021 09:46:05 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 17KDj7Ds007907
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 20 Aug 2021 15:45:07 +0200
Received: from [167.87.0.29] ([167.87.0.29])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17KDj6ZU022537;
        Fri, 20 Aug 2021 15:45:06 +0200
Subject: Re: [PATCH] watchdog: iTCO_wdt: Fix detection of SMI-off case
From:   Jan Kiszka <jan.kiszka@siemens.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Christian Storm <christian.storm@siemens.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?Q?Mantas_Mikul=c4=97nas?= <grawity@gmail.com>
References: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
Message-ID: <1444efd5-b778-949b-34e8-99d2541350e9@siemens.com>
Date:   Fri, 20 Aug 2021 15:45:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 26.07.21 13:46, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Obviously, the test needs to run against the register content, not its
> address.
> 
> Fixes: cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on second timeout")
> Reported-by: Mantas Mikulėnas <grawity@gmail.com>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  drivers/watchdog/iTCO_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index b3f604669e2c..643c6c2d0b72 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -362,7 +362,7 @@ static int iTCO_wdt_set_timeout(struct watchdog_device *wd_dev, unsigned int t)
>  	 * Otherwise, the BIOS generally reboots when the SMI triggers.
>  	 */
>  	if (p->smi_res &&
> -	    (SMI_EN(p) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
> +	    (inl(SMI_EN(p)) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
>  		tmrval /= 2;
>  
>  	/* from the specs: */
> 

Ping, this is still missing in master. Stable kernels had the revert,
but 5.14 will need this.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
