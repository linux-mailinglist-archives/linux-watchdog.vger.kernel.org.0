Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3D76E2239
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Apr 2023 13:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbjDNLcO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Apr 2023 07:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjDNLcN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Apr 2023 07:32:13 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FEB4A5E3
        for <linux-watchdog@vger.kernel.org>; Fri, 14 Apr 2023 04:31:52 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id kt6so6606926ejb.0
        for <linux-watchdog@vger.kernel.org>; Fri, 14 Apr 2023 04:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681471904; x=1684063904;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jwXYFBzbS7qmut3eza5zD1XmDDlqA0VGbM9zH71iqE=;
        b=uz3YGGGh1WIUzK5nb6vzZtT+IWY9+fITr45V4nvz/hxzO1MqXi2UhqV03a68CRNyEG
         5tlTNUL23h7HjO7AifGn/HAxZ0OAa2ofd31mCkx5k081sEK8ApwJ8DyxRLH2csldMbAX
         SHt12haQsUfxxLVbexh412tIksTtO91ovpZB07eE7lYAKvtlqhFqi9efrTQrxFe3KRb5
         LLKw+tsH0yZoIQf2PwCEybCiXNOoZcug8N0fPIkVwrEHPblWciukInisZN3fcixdOSb/
         shLjDgbkbs2KrxQoyBifk+T11G54g9c+W3JAr80Q73XCtPX8V8nH1BQ/ARroUjZvOa6J
         k5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681471904; x=1684063904;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jwXYFBzbS7qmut3eza5zD1XmDDlqA0VGbM9zH71iqE=;
        b=GoHQC23jDMd6xhQruo9UV+/3Sqbb+2rUgUO062F0f9rOy1Ixx7rB7OX4wHfQRQG08t
         WSg/ICsoO13d4BG0BGfb3JVMJihQBXE2ExGrWtU3O9CVI6gtwerO+G58WA0k69VM3TeZ
         I4B08JMKvwU9OQ21jP5HIYtDCpP17Q/fUvixr20dIVbHpRn8MD36BPOtPaBQe2YcK4kd
         bNw4gPgrNALfTA3fcIlt0bAM+TcdNlnUtRShOPzQhFkP6E3JU0hxu1nP3MibxnuywiZA
         8ZlJoQ9QKr8Y+fjttwXn1RpYm5EP0boiJewr7mLzPNAEpOUzvDCmz98C32e2HKI+hc15
         wY3w==
X-Gm-Message-State: AAQBX9cbx41F4SZEjD8tvdtnRxWfoK0pB1KnTVTATEHER+DUehpE9llg
        E4cuADvL6BO1uFFCG9zutIJtAA==
X-Google-Smtp-Source: AKy350aBB3M1mZlxR5fmk5313CkKmhcQlFOBFoJdqAvGHGzTYdHq4T2OaQIjfb1exA/Ykuae0rqAyA==
X-Received: by 2002:a17:906:3888:b0:94a:8a82:9cab with SMTP id q8-20020a170906388800b0094a8a829cabmr6016358ejd.42.1681471904108;
        Fri, 14 Apr 2023 04:31:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:40b9:8c57:b112:651d? ([2a02:810d:15c0:828:40b9:8c57:b112:651d])
        by smtp.gmail.com with ESMTPSA id hs13-20020a1709073e8d00b0094ece70481csm1311311ejc.197.2023.04.14.04.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 04:31:43 -0700 (PDT)
Message-ID: <875aaaa6-ac8a-fbf6-edd3-fde5444220b8@linaro.org>
Date:   Fri, 14 Apr 2023 13:31:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [EXT] Re: [PATCH 1/2] dt-bindings: watchdog: marvell octeonTX2
 GTI system atchdog driver
Content-Language: en-US
To:     Bharat Bhushan <bbhushan2@marvell.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230414102342.23696-1-bbhushan2@marvell.com>
 <a5aa1be1-f98d-af04-9879-b924a5bcb14c@linaro.org>
 <DM5PR1801MB1883C0B40D8D7C84BA0435FDE3999@DM5PR1801MB1883.namprd18.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DM5PR1801MB1883C0B40D8D7C84BA0435FDE3999@DM5PR1801MB1883.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 14/04/2023 13:29, Bharat Bhushan wrote:

> 
>>
>>> +
>>> +examples:
>>> +  - |
>>> +    soc {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        watchdog@802000040000 {
>>> +          compatible = "marvell-octeontx2-wdt";
>>> +          reg = <0x8020 0x40000 0x0 0x20000>;
>>
>> Are you sure that this is correct DTS? 32-bit numbers are usually 8-digit long. Plus
>> size of 0x20000 is crazy huge. And the unit address is a bit unusual. Are you sure
>> dtc W=1 does not say about any errors in your DTS?
> 
> Each cell is 32bit, so if we specify less than upper values becomes zeros (0s). 

... and what is the convention/coding style of your subarch? Is to have
short or 0-padded reg addresses?

Anyway, I have doubts this was tested, so please confirm that dtbs W=1
and dtbs_check produce no errors on your DTS. BTW, where is the DTS?

Best regards,
Krzysztof

