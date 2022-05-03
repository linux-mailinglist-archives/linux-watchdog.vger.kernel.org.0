Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC702517DE4
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 May 2022 08:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbiECG6L (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 May 2022 02:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbiECG54 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 May 2022 02:57:56 -0400
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A6A39160;
        Mon,  2 May 2022 23:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=C7RFMstTl4jwHT+d0u+++fDTzM+3xLA3Xcck8XaP+Cc=; b=MOrBHZB04v/5F6LEURPMJroGIx
        yugUe6BD5N6xzGYyUcI6hvIcnp/S9VZ5oxE1QzRZIgSG8fZFi8uBIZJevdGEayM+1KPiejtRLiC1F
        j0CSnWm4TB9uJRYqoEngYOmY5Cpt35VQ+gpLcvGSwM0uHl6zhQ9S5phKW4gJarApLfeJbs5aWoVP3
        SJwcEj/6An+HoKpOol+0EvNDEdS4eHOs5p9sNT4DMhbOKomw1PjnfdCs4OK0Yod7Rov+357STET+n
        cK2XR+TLPqjRS/J56rHmS5f48w2hCsf7FyjKHd5f7p0grzNHOatpDCS1Rhynfck9/qIVw+tB60r3L
        l/2nDliQ==;
Received: from [89.212.21.243] (port=56156 helo=[192.168.69.116])
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <primoz.fiser@norik.com>)
        id 1nlmPd-004FT6-SU;
        Tue, 03 May 2022 08:53:41 +0200
Message-ID: <bdedde60-aba8-5f7f-3a4a-b442e80fbb17@norik.com>
Date:   Tue, 3 May 2022 08:53:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: mfd: da9063: watchdog: add suspend
 disable option
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <support.opensource@diasemi.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrej Picej <andrej.picej@norik.com>, upstream@phytec.de
References: <20220422072713.3172345-1-primoz.fiser@norik.com>
 <YnBFg4exZKkqkxDo@robh.at.kernel.org>
From:   Primoz Fiser <primoz.fiser@norik.com>
In-Reply-To: <YnBFg4exZKkqkxDo@robh.at.kernel.org>
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
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Rob,

>> Name the property based on the h/w quirk rather than what to do in
>> response. Something like 'dlg,hw-suspend-broken'

Shouldn't we match da9062's property?

As this commit is based on c514430c51ee8 ("dt-bindings: watchdog: 
da9062: add suspend disable option") which uses "dlg,use-sw-pm" as 
property to implement the same functionality.

Sure I can spin up v2 with your proposal but I think that would create 
unnecessary ambiguity and confusion?

For example, phyCORE board uses da9062 PMIC while phyFLEX uses da9063 as 
PMIC. Boards are from the same SoM vendor. So one board would have to 
use "dlg,use-sw-pm" and the other one "dlg,hw-suspend-broken" property 
to achieve the same thing?


On 2. 05. 22 22:56, Rob Herring wrote:
> On Fri, Apr 22, 2022 at 09:27:11AM +0200, Primoz Fiser wrote:
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
>> diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt b/Documentation/devicetree/bindings/mfd/da9063.txt
>> index 91b79a21d403..aa8b800cc4ad 100644
>> --- a/Documentation/devicetree/bindings/mfd/da9063.txt
>> +++ b/Documentation/devicetree/bindings/mfd/da9063.txt
>> @@ -64,10 +64,13 @@ Sub-nodes:
>>       and KEY_SLEEP.
>>   
>>   - watchdog : This node defines settings for the Watchdog timer associated
>> -  with the DA9063 and DA9063L. There are currently no entries in this
>> -  binding, however compatible = "dlg,da9063-watchdog" should be added
>> -  if a node is created.
>> +  with the DA9063 and DA9063L. The node should contain the compatible property
>> +  with the value "dlg,da9063-watchdog".
>>   
>> +  Optional watchdog properties:
>> +  - dlg,use-sw-pm: Add this property to disable the watchdog during suspend.
> 
> Name the property based on the h/w quirk rather than what to do in
> response. Something like 'dlg,hw-suspend-broken'
> 
>> +  Only use this option if you can't use the watchdog automatic suspend
>> +  function during a suspend (see register CONTROL_B).
>>   
>>   Example:
>>   
>> -- 
>> 2.25.1
>>
>>
