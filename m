Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35708522DE3
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 May 2022 10:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243325AbiEKIKF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 May 2022 04:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243317AbiEKIKD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 May 2022 04:10:03 -0400
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439EE9C2EE;
        Wed, 11 May 2022 01:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=TGOIv/8rbn1C0gTA16Bjc0o3XPW3/BNE1GSk8qF7UJc=; b=m7rRRCNUuR47fbqTAw/0v6hNeE
        PjGuic9a+dmtllMp3NrOFSgXlCtNB6Uo8y2fQJD6yLSxClJy/Zb56JUKp+r30ymA16ti6nmyDqux+
        sYGerUWQ5/5UeHPEPKnTB2snpOryLfOEDhIgdlS7b0NDHEIGm/t+xG/rSXUVtZIKCSXRLFM4JQ3Kg
        lZ+sLy5mKegfWuCV2X165y7Kvw17MBheChCLzHGdLF7uDBvqq3ypjwZcwbvKJuq91WAlbZu5g35Qp
        oOV2x7X7T26hVFmv25hbJmQrH7MmQs3nF5FYSmDq3j5IrtiQXwBAX93mX7kEsRYPjbtm8/ImOmqpO
        8kHgyRBQ==;
Received: from [89.212.21.243] (port=58198 helo=[192.168.69.116])
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <primoz.fiser@norik.com>)
        id 1nohPm-00ERrq-Qh;
        Wed, 11 May 2022 10:09:54 +0200
Message-ID: <cb5b07ea-1c09-1dcb-a4a9-12276647d634@norik.com>
Date:   Wed, 11 May 2022 10:09:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] dt-bindings: mfd: da9063: watchdog: add suspend
 disable option
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
 <OSAPR01MB5060A0D9B7EB66F108F34AFFB0C69@OSAPR01MB5060.jpnprd01.prod.outlook.com>
From:   Primoz Fiser <primoz.fiser@norik.com>
In-Reply-To: <OSAPR01MB5060A0D9B7EB66F108F34AFFB0C69@OSAPR01MB5060.jpnprd01.prod.outlook.com>
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


On 9. 05. 22 10:50, DLG Adam Thomson wrote:
> On 22 April 2022 08:27, Primoz Fiser wrote:
> 
>> Document the watchdog disable option which can be used if the hardware
>> automatic suspend option is broken.
>>
>> Based on commit c514430c51ee8 ("dt-bindings: watchdog: da9062: add
>> suspend disable option").
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>>   Documentation/devicetree/bindings/mfd/da9063.txt | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt
>> b/Documentation/devicetree/bindings/mfd/da9063.txt
>> index 91b79a21d403..aa8b800cc4ad 100644
>> --- a/Documentation/devicetree/bindings/mfd/da9063.txt
>> +++ b/Documentation/devicetree/bindings/mfd/da9063.txt
>> @@ -64,10 +64,13 @@ Sub-nodes:
>>       and KEY_SLEEP.
>>
>>   - watchdog : This node defines settings for the Watchdog timer associated
> 
> I don't know if this is just me, but it looks like you're deleting this line
> above, but not replacing it.....

I am not deleting this line, please note the leading white-space.

But yeah, if you don't pay close attention it looks a bit confusing 
indeed :)

> 
>> -  with the DA9063 and DA9063L. There are currently no entries in this
>> -  binding, however compatible = "dlg,da9063-watchdog" should be added
>> -  if a node is created.
> 
> ....here, if I'm reading this patch correctly. This means we're losing that
> property description, and starting a text block with the below text.
> 
>> +  with the DA9063 and DA9063L. The node should contain the compatible
>> property
>> +  with the value "dlg,da9063-watchdog".
>>
>> +  Optional watchdog properties:
>> +  - dlg,use-sw-pm: Add this property to disable the watchdog during suspend.
>> +  Only use this option if you can't use the watchdog automatic suspend
>> +  function during a suspend (see register CONTROL_B).
>>
>>   Example:
>>
>> --
>> 2.25.1
> 

Would you like:

The node should contain the compatible property with the value 
compatible = "dlg,da9063-watchdog".

i.e. explicitly adding "compatible =" in front, for v2?
