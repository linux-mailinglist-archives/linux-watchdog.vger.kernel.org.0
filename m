Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1B8F522EB2
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 May 2022 10:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244000AbiEKIsH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 May 2022 04:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243938AbiEKIsA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 May 2022 04:48:00 -0400
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C0069295;
        Wed, 11 May 2022 01:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uZrqCcYB8V87a970UojFCzLlnS3Bd1oPYpDPFaknOZc=; b=khYEr2vjxElfMXbJ6/LCJP8fFk
        c9xNsuutJohJ9PnOeWKWu4P5e1FoUqnpP9r3TZC/G3IMFoIUJUAg8Ojrf2eIlNfvzBKS8uZBLR8i4
        s8jl8MuVfgPUC+Iqr365p4+RBucmv8nUjh4L6jkQez/nzUpGB3d4CwBs2DOhPfVhbDJB3yE7mE+n4
        cEyJtOBuR2QfQ58uvpLVmfyKQ3kb0CnswApYnbR43/g70hHRFR7jovL+26fRzet7ZnPUrXlun2GQ7
        rVyJiHuJXDqfQH8yNx8g9CsgZwwV/8EAxyR7iIDQkqgqqhVZKKUS6ax3IOPRyQc14Zl0FYxPusP2a
        qzzs7sew==;
Received: from [89.212.21.243] (port=59568 helo=[192.168.69.116])
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <primoz.fiser@norik.com>)
        id 1noi0W-00EXqO-Cg;
        Wed, 11 May 2022 10:47:52 +0200
Message-ID: <210bbfdc-32ac-737e-15ad-a2de12464e52@norik.com>
Date:   Wed, 11 May 2022 10:47:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] watchdog: da9063: optionally disable watchdog during
 suspend
Content-Language: en-US
To:     DLG Adam Thomson <DLG-Adam.Thomson.Opensource@dm.renesas.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <Support.Opensource@diasemi.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrej Picej <andrej.picej@norik.com>,
        "upstream@phytec.de" <upstream@phytec.de>
References: <20220422072713.3172345-1-primoz.fiser@norik.com>
 <20220422072713.3172345-2-primoz.fiser@norik.com>
 <OSAPR01MB50604479A24C65CAD349104DB0C69@OSAPR01MB5060.jpnprd01.prod.outlook.com>
From:   Primoz Fiser <primoz.fiser@norik.com>
In-Reply-To: <OSAPR01MB50604479A24C65CAD349104DB0C69@OSAPR01MB5060.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


On 9. 05. 22 12:38, DLG Adam Thomson wrote:
> On 22 April 2022 08:27, Primoz Fiser wrote:
> 
>> Optionally disable watchdog during suspend (if enabled) and re-enable
>> it upon resume.
>> This enables boards to sleep without being interrupted by the watchdog.
>>
>> This patch is based on commit f6c98b08381c ("watchdog: da9062: add
>> power management ops") and commit 8541673d2a5f ("watchdog: da9062: fix
>> power management ops") and brings the same functionality to DA9063.
> 
> There's a WATCHDOG_PD bit (set to 0) to achieve this I believe, and thus
> removes the need for the suspend/resume PM functions. Is this something you've
> tried? Also seems to be present for DA9061/2 as well so can't remember why that
> wasn't used there.

Ideally one should be able to use WATCHDOG_PD bit indeed.

However there are boards out there which don't have the ability to use 
the PMIC's powerdown/active mode due to PCB design and thus PMIC is left 
enabled during suspend i.e. cannot use the POWERDOWN mode.

Check mailing list correspondence [1] which already gave explanation why 
there was a need to implement such quirks for da9062 and the need to 
handle this in software instead of hardware.

Links:

[1] 
https://lore.kernel.org/all/20191128171931.22563-1-m.felsch@pengutronix.de/
