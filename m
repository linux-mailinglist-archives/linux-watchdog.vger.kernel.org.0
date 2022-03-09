Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 555654D3DE3
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Mar 2022 01:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238914AbiCJAIB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Mar 2022 19:08:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238908AbiCJAIA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Mar 2022 19:08:00 -0500
X-Greylist: delayed 1491 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Mar 2022 16:06:59 PST
Received: from gateway23.websitewelcome.com (gateway23.websitewelcome.com [192.185.50.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC08123412
        for <linux-watchdog@vger.kernel.org>; Wed,  9 Mar 2022 16:06:59 -0800 (PST)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway23.websitewelcome.com (Postfix) with ESMTP id 544124D
        for <linux-watchdog@vger.kernel.org>; Wed,  9 Mar 2022 17:42:08 -0600 (CST)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id S5wWnMP0D9AGSS5wWncTcl; Wed, 09 Mar 2022 17:42:08 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=GPyJkkzP2b2Zzo0Mi+hbVkx7KDeH96AGeS0W7v+SO+s=; b=OuoQIRyOFs0Tpv9h58tBwa6OLI
        /i0153JtPSaqeGelbVsHSf8+BC2QA17NWy+NgwcM12ZOUJwFsENUO/jYvsw+StsyPbGz85gPSU3Aj
        tEOHfnVv4isZ47YsK9o8XakEgMkOj1xDjrG8M6Pe1QL02BqPyGkzgO/AUPMAzOscZkuO6TYVvbmgB
        SAKEaQCAeEXw4zMfAVEGViVmLMKEerLw2UqG8P5WbsJfTPAqMIQMvn9GPvxxLp5+LehH4tsGG3Rhg
        UILWSV6fqvjoYsCmLgSB3L6Av56XbiyldfDa1DhQexhU64f+S2n012MkSFsAQlXRc1Zyz51F6AuqU
        juofjcWw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54206)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nS5wV-000dtB-Om; Wed, 09 Mar 2022 23:42:07 +0000
Message-ID: <53821770-23b0-11ef-a76a-1e0beda01c42@roeck-us.net>
Date:   Wed, 9 Mar 2022 15:42:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 0/7] RZG2L_WDT Fixes and Improvements
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20220225175320.11041-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922BE07E79DB3CF32B8D95C86089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <OS0PR01MB5922BE07E79DB3CF32B8D95C86089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nS5wV-000dtB-Om
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:54206
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 101
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/7/22 00:52, Biju Das wrote:
> Hi All,
> 
> Gentle ping. Are we happy with this patch series?
> 
> Please let me know.
> 

Should be good to go. I added the series to my watchdog-next branch.
Usually Wim picks it up from there.

Guenter

> Cheers,
> Biju
> 
>> Subject: [PATCH v5 0/7] RZG2L_WDT Fixes and Improvements
>>
>> The first 4 patch in this series fixes the below issues
>> 1) 32 bit overflow issue
>> 2) Runtime PM usage count issue
>> 3) BUG: Invalid context during reset.
>> 4) Reset control imbalance
>>
>> The later 3 patches are enhancements to the WDT driver.
>> 1) Adding error check for reset_control_deassert() and fixing
>> reset_control imbalance.
>> 2) Generate Parity error for WDT reset
>> 3) Add support for set_timeout callback
>>
>> v4->v5:
>>   * Updated commit description of patch#4
>>   * Added Rb tag from Geert.
>>   * Separated reset control imbalance from patch#4
>>
>> Biju Das (7):
>>    watchdog: rzg2l_wdt: Fix 32bit overflow issue
>>    watchdog: rzg2l_wdt: Fix Runtime PM usage
>>    watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait context'
>>    watchdog: rzg2l_wdt: Fix reset control imbalance
>>    watchdog: rzg2l_wdt: Add error check for reset_control_deassert
>>    watchdog: rzg2l_wdt: Use force reset for WDT reset
>>    watchdog: rzg2l_wdt: Add set_timeout callback
>>
>>   drivers/watchdog/rzg2l_wdt.c | 83 ++++++++++++++++++++----------------
>>   1 file changed, 47 insertions(+), 36 deletions(-)
>>
>> --
>> 2.17.1
> 

