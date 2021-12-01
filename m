Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACCDA464750
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Dec 2021 07:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235762AbhLAGqJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Dec 2021 01:46:09 -0500
Received: from cpanel.siel.si ([46.19.9.99]:37018 "EHLO cpanel.siel.si"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231351AbhLAGqJ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Dec 2021 01:46:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=9tEWLLnoJ9e/iCRhS+OvG8quy9qZa4ZHjFXJse9l/Ag=; b=EQkdbl7ihTADupGzMOsgPpKTj/
        ikIB0kjr8s7dqsUO2H/ZuT6bYtj7F8Zu6/p3WUEuRpd7sYGFYQECxS+lCaINd5Zu7liN3obNYyy6p
        YIsJigoVgTwVtL4J3x5drEnvW4Q0f1Wf599K9VhtffYGONNB/8GErSjkFIJJG7OEe5hBi1jHhhxf3
        h+R7tgYZ9unVfmnl4ogCHkamH6a3toBu+1qwrESAR9cXJQaaGbIrATxnMK4GGEHPndF/8uezDe1pA
        rieW9UbBXtPxkXw3QxdsvG6fV+rQ6GjZ+gJjPLOXNzV5eMfM6QuGs5+OWi17dN1ROIz9LBha+RaJq
        xB+zzKEw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:58376 helo=[192.168.69.215])
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <andrej.picej@norik.com>)
        id 1msJK8-007T3q-Me; Wed, 01 Dec 2021 07:42:44 +0100
Subject: Re: [PATCH v2 3/4] dt-bindings: watchdog: da9062: add watchdog
 timeout mode
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Support Opensource <Support.Opensource@diasemi.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <20211130134242.3516619-1-andrej.picej@norik.com>
 <20211130134242.3516619-3-andrej.picej@norik.com>
 <4591cdd6-9a7b-cd1d-817d-8950c8976d10@roeck-us.net>
 <DB9PR10MB4652C8A69A6A3F38B93ED18880679@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <dcd75a82-5837-8d78-0a9f-6e5b7eafff28@roeck-us.net>
 <DB9PR10MB46521F419F43685F7103D32480679@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
From:   Andrej Picej <andrej.picej@norik.com>
Message-ID: <ef3f98e1-6661-84ed-1bde-747b1330aba2@norik.com>
Date:   Wed, 1 Dec 2021 07:42:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <DB9PR10MB46521F419F43685F7103D32480679@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


On 30. 11. 21 18:46, Adam Thomson wrote:
> On 30 November 2021 16:40, Guenter Roeck wrote:
> 
>>>> Why does it need a value ? Why not just bool ?
>>>
>>> One argument might be that if the property isn't provided then the OTP
>>> configured value can persist without needing a FW change around this DT
>> binding.
>>>
>>> My belief though is that the majority of users would have this property set to 0
>>> by default in OTP, so a boolean would be OK I think here to enable watchdog
>>> shutdown.
>>>
>>
>> Sorry, you lost me.
>> 	dlg,wdt-sd = <0>;
>> is the current situation, and identical to not having the property in
>> the first place.
>> 	dlg,wdt-sd = <1>;
>> is new. I don't see the difference to
>> 	dlg,wdt-sd;
>> vs. not having the property at all (which is, again, the current situation).
>> Since it has to be backward compatible,
>> 	dlg,wdt-sd = <0>;
>> will always be identical to not having the property at all.
>> I can not find a situation where an integer would have any benefits over a
>> boolean.
> 
> So if you have a binary DT binding, it's either there or it isn't which implies
> the bit to be set to 0/1 in this case. If you have a binding which has a value,
> there can be 3 outcomes in this discussion:
> 
>   1) Binding = 0, bit is set to 0
>   2) Binding = 1, bit is set to 1
>   3) Binding NOT present in DT, OTP default value in HW remains untouched
> 
> Say a platform updates to a later kernel version, but sticks with existing DT
> FW (i.e. the new boolean binding isn't present in FW), then the following could
> happen:
> 
>   1) OTP for DA9061/2 has this bit set to 1, system expectation is that watchdog
>      triggers SHUTDOWN.
>   2) New driver checks existance of 'dlg,wdt-sd' but it's obviously not there so
>      assumes the bit should be set to 0 and does so
>   3) When the watchdog fires, it will no longer trigger SHUTDOWN but instead
>      POWER-DOWN due to binary handling of new boolean binding.
> 

This was my thinking exactly. I also first thought about boolean value, 
but I then moved to the integer value of 0 or 1 after checking the OTP 
default for this bit. The da9062 I'm working with has the bit set to 1 
by default.
