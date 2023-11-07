Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4D757E37A2
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Nov 2023 10:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233882AbjKGJVP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Nov 2023 04:21:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233945AbjKGJVO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Nov 2023 04:21:14 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36A711A
        for <linux-watchdog@vger.kernel.org>; Tue,  7 Nov 2023 01:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1699348871; x=1730884871;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aaQ+e1gtv7XsMbPJpA/aqEXw5CPM0LAD0KXGMV7hAHs=;
  b=gpPd0rjExYm2jT2RslDp8DF8FGo9t9C1ZhqLnUxYDGbpQsHgBokJVKpn
   EeejMG9XPeffYGQ8wSeLyirul08U18SOkOKNgbLfQb980TdSHM+fsPkTv
   6gKpJ82ZWjw0yIeOsoeZhPJX3/v761NLZUcIiBleNKWzK/jZme7+yN79v
   pE/+S8hFU96E8DOoWmFTlX9O6SCzUxE/2VcDng0qcaED197WQdRN3QPAQ
   LX9uWulgQxO4aB/rHeMOpP2bHQ3kRkBnVIwvty28jy6uPQ8VWFL+aFc/i
   lumVZ7GYTd7jGfboQVnX36nde5FQy1i5Fqxq/sPOrD4fFN78ZIQDY6HSZ
   Q==;
X-CSE-ConnectionGUID: VDAegif0RAq7Bdxv8DyEBA==
X-CSE-MsgGUID: PrQGUG8cSeKZnl8pPcWhUQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="11908176"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Nov 2023 02:21:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Nov 2023 02:20:57 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Tue, 7 Nov 2023 02:20:55 -0700
Message-ID: <4eb33ec0-a430-431a-b127-be8ebe7e2163@microchip.com>
Date:   Tue, 7 Nov 2023 10:20:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] watchdog: at91sam9_wdt: Convert to platform remove
 callback returning void
Content-Language: en-US, fr-FR
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@pengutronix.de>
References: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
 <20231106154807.3866712-4-u.kleine-koenig@pengutronix.de>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20231106154807.3866712-4-u.kleine-koenig@pengutronix.de>
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
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Uwe!

Best regards,
   Nicolas

> ---
>   drivers/watchdog/at91sam9_wdt.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

[..]

