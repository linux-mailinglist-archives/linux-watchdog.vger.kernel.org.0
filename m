Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28EB17E376F
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Nov 2023 10:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbjKGJUh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Nov 2023 04:20:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233933AbjKGJUe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Nov 2023 04:20:34 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1157B10A;
        Tue,  7 Nov 2023 01:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1699348833; x=1730884833;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ty6/O6J9ZeOHNpcRydrxpthEDYq+jEaqT+wwfhl3Yaw=;
  b=iV6jjimwN+9ecMbamVoiVtxRrHwhx/rAEU01riDylYzsUS3gSVERLeRf
   od1RqlCRH5xhKj6MayxlbLMlrc4AgtoHJDTVu9QKPZJW1oIc90ZXrOMm5
   Jmdp9EVWySe2Z3g8EXgPWCtv8oa7mcDwdiXDJn07tP6d6LNzcJM2ANrEW
   eUBx5xQYBXqGlDgBAdoiA8ik7CFBnM/v6j0L5YiZ4KcZ1sQ32gHn/lb2b
   /BbYxnpvDUovcuboaTvOAz0n3HV6EAvoa40VwmONmJ6SS07vECsuTkZNV
   iO/qeRRBQGDcuUEwolWBV/VGbCsCvxGBf0aCzb0NpOU8/Fs4RDaRPhFOV
   w==;
X-CSE-ConnectionGUID: a6ClygnyScu//yMtsjnvfQ==
X-CSE-MsgGUID: GfA5zt2BRASIffjZ0lOfPA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="11316970"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Nov 2023 02:20:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Nov 2023 02:20:19 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Tue, 7 Nov 2023 02:20:17 -0700
Message-ID: <b946ef1d-b367-4ecf-92b8-349505517d86@microchip.com>
Date:   Tue, 7 Nov 2023 10:19:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] watchdog: at91sam9: Stop using
 module_platform_driver_probe()
Content-Language: en-US, fr-FR
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@pengutronix.de>,
        <linux-kbuild@vger.kernel.org>
References: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
 <20231106154807.3866712-2-u.kleine-koenig@pengutronix.de>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20231106154807.3866712-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 06/11/2023 at 16:48, Uwe Kleine-König wrote:
> On today's platforms the benefit of platform_driver_probe() isn't that
> relevant any more. It allows to drop some code after booting (or module
> loading) for .probe() and discard the .remove() function completely if
> the driver is built-in. This typically saves a few 100k.
> 
> The downside of platform_driver_probe() is that the driver cannot be
> bound and unbound at runtime which is ancient and also slightly
> complicates testing. There are also thoughts to deprecate
> platform_driver_probe() because it adds some complexity in the driver
> core for little gain. Also many drivers don't use it correctly. This
> driver for example misses to mark the driver struct with __refdata which
> is needed to suppress a (W=1) modpost warning:
> 
>          WARNING: modpost: drivers/watchdog/at91sam9_wdt: section mismatch in reference: at91wdt_driver+0x4 (section: .data) -> at91wdt_remove (section: .exit.text)
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   drivers/watchdog/at91sam9_wdt.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

[..]

