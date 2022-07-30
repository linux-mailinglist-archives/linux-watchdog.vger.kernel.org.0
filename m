Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8A835858EB
	for <lists+linux-watchdog@lfdr.de>; Sat, 30 Jul 2022 09:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiG3HBI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 30 Jul 2022 03:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiG3HBI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 30 Jul 2022 03:01:08 -0400
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B7211477
        for <linux-watchdog@vger.kernel.org>; Sat, 30 Jul 2022 00:01:05 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.hostpark.net (Postfix) with ESMTP id C3CA316586;
        Sat, 30 Jul 2022 09:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=elsoft.ch; h=
        content-transfer-encoding:content-type:content-type:in-reply-to
        :mime-version:user-agent:date:date:message-id:organization:from
        :from:references:subject:subject:received:received; s=sel2011a;
         t=1659164461; bh=3nZ60mmLa7rYLIlfCUvN9oUW9CFJmAPkB39O8He+I3o=; b=
        nOpfHAXtb/Btc5SAGHcMQEc4gFBmoZLdQnRXDTp8yme/66iW9RziMB3X8VO6jiS+
        SRT0KWjBHTpQm1Dr3OU37AXr26eARRjQ1HyVpXb8nNPQg8HNWxlrW0q4m/4fHkYT
        vywiG7QUmXkV0tm8GthtzfEFBLjABbtfkHo2lMT9OQo=
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
        by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
        with ESMTP id HUvV2RNa3MAb; Sat, 30 Jul 2022 09:01:01 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        by mail.hostpark.net (Postfix) with ESMTPA id 93B2B16575;
        Sat, 30 Jul 2022 09:01:01 +0200 (CEST)
Subject: Re: [RFC] [PATCH v2] watchdog: Exar/MaxLinear XR28V38x driver
To:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
References: <20220729113305.17225-1-d.mueller@elsoft.ch>
 <490a6183-414e-bf2e-c6e3-0d35943233aa@roeck-us.net>
From:   =?UTF-8?Q?David_M=c3=bcller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Organization: ELSOFT AG
Message-ID: <6a218785-b568-12a9-0209-f9f7dcec3c79@elsoft.ch>
Date:   Sat, 30 Jul 2022 09:01:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 SeaMonkey/2.53.13
MIME-Version: 1.0
In-Reply-To: <490a6183-414e-bf2e-c6e3-0d35943233aa@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello and again thanks for your comments

Guenter Roeck schrieb am 29.07.22 um 17:42:
> On 7/29/22 04:33, David Müller wrote:

>> +    /*
>> +     * use two accesses with different values to make sure
>> +     * that a combination of a previous single access and
>> +     * the ones below wi0th the same value are not falsely
> 
> with

Yeah, I saw it a minute after sending this patch.

>> +    snprintf((char *)n->name, sizeof(n->name) - 1, DRV_NAME ".%d", idx);
> 
> Better use scnprintf().

Ok, will fix.

>> +    priv->wdt_res.name = n->name;
> 
> Is it really necessary to have a unique resource name for each instance
> (or a resource name in the first place) ?

I find it quite handy to have unique resource names displayed for 
example in "/proc/ioports":

root@test:~# cat /proc/ioports
[...]
   0a00-0a0f : pnp 00:01
     0a00-0a01 : exar_wdt.0
     0a08-0a09 : exar_wdt.1
[...]
