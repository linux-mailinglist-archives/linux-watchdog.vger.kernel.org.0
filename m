Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9153969A619
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Feb 2023 08:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbjBQH3K convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Feb 2023 02:29:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjBQH3J (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Feb 2023 02:29:09 -0500
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB7265A0;
        Thu, 16 Feb 2023 23:28:53 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5D5A624DE83;
        Fri, 17 Feb 2023 15:28:32 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Feb
 2023 15:28:32 +0800
Received: from [192.168.125.128] (183.27.98.67) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Feb
 2023 15:28:30 +0800
Message-ID: <267ab62d-d680-d505-4183-ccb8c654419e@starfivetech.com>
Date:   Fri, 17 Feb 2023 15:29:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 2/3] drivers: watchdog: Add StarFive Watchdog driver
Content-Language: en-US
From:   Xingyu Wu <xingyu.wu@starfivetech.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        Samin Guo <samin.guo@starfivetech.com>,
        <linux-kernel@vger.kernel.org>
References: <20221219094233.179153-1-xingyu.wu@starfivetech.com>
 <20221219094233.179153-3-xingyu.wu@starfivetech.com>
 <20230201224619.GA3194283@roeck-us.net>
 <1f18bfdc-7a04-4914-d970-7ef1d4f99653@starfivetech.com>
 <bfc81429-1829-bec1-ac29-0559f6a01215@roeck-us.net>
 <c0b03600-13a9-b9e7-e4f3-701fd5b55c86@starfivetech.com>
In-Reply-To: <c0b03600-13a9-b9e7-e4f3-701fd5b55c86@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [183.27.98.67]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2023/2/17 10:30, Xingyu Wu wrote:
> On 2023/2/16 22:57, Guenter Roeck wrote:
>> On 2/15/23 23:11, Xingyu Wu wrote:
>>> On 2023/2/2 6:46, Guenter Roeck wrote:
>>>> On Mon, Dec 19, 2022 at 05:42:32PM +0800, Xingyu Wu wrote:
>>>>> Add watchdog driver for the StarFive JH7110 SoC.
>>>>>
>>>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>>>> +
>>>>> [...]
>>>>> +
>>>>> +static const struct watchdog_info starfive_wdt_ident = {
>>>>> +    .options = OPTIONS,
>>>>> +    .firmware_version = 0,
>>>>
>>>> It is not necessary to initilize a static variable with 0.
>>>>
>>>>> +    .identity = "StarFive Watchdog",
>>>>> +};
>>>
>>> Hi Guenter,
>>>
>>> It would be a compilation error if drop the '0'. I found that other files
>> 
>> No.
>> 
>>> initialize this static variable as well.
>>>
>> 
>> Ah, the old "others do it, so do I" argument.
>> Sorry, that is not a valid argument.
>> 
> 
> Can I assign ‘firmware_version’ to a macro definition in the probe?
> 

Or drop the 'firmware_version' ?

Best regards,
Xingyu Wu

