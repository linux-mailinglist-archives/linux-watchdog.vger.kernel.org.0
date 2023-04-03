Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85E446D50B2
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Apr 2023 20:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233242AbjDCSfm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Apr 2023 14:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233240AbjDCSfl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Apr 2023 14:35:41 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E4240F2
        for <linux-watchdog@vger.kernel.org>; Mon,  3 Apr 2023 11:35:09 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id eg48so120979572edb.13
        for <linux-watchdog@vger.kernel.org>; Mon, 03 Apr 2023 11:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680546905;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ueGbaW2O+Qwz3FkYgXkwgtIxdt5rpvOVab1WmVRUhSY=;
        b=LUhiSNSR1HYwkvfRr64wDu/aXbdSfatLXVuH0q5ognTmyktUbLzd6mRBhDOciDRefm
         8EAJZ4JcaI020aGXQRQUC05yN/d4SHCCTowEMoxS21hnCH96GomWI8PNHQme5fDt+Py4
         jI7V50GLVlCYGR3QJ8cDSFQZ5eqgPZD4K3Ym2g6npRGyIyhZGWLX3IBPWDypLktIH9rE
         jRKBVd9tC8YcTFvy1mbHK25CSKU/kKL93qdD9EnjAn+mwH7kWD/8E0KLs55JqOds+h1r
         sPpY9/rya2DtOV5Dz6pZTh6dwvMzUYxncbE5EzRq48VS28+Q/rcCxn70n9sWvuT5+K4D
         yTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680546905;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueGbaW2O+Qwz3FkYgXkwgtIxdt5rpvOVab1WmVRUhSY=;
        b=U8pbyYZNLljxjE/akP5WM1CobKDBMNQRUyYwB+J2Ib3IhfAfc0z/kodV+ZT2rRpBIV
         ukPAHvgFcR8bvSd8VnxfKeD8J5oPYuilnwU8Y8LAvhOpyRBXMQ/d/Prw2DbwNyMpzaPb
         Ek5YkZoUzvJYL/2tJtl34ZgPeXgoobhQACQmg0n7s5YuCyL4SAlOV4Xb4brFArL+f3NE
         8P944wKvwWaJuxyjt/qeEQ/hZWvNm3EMRNQGhPUL7DdTHGO3iJBOISzFf+UF3offXHqT
         /3I+fMrsl/rIdXMXnT+WdtlR/zsGP9HYRzuHTkATX66g0B64j9SkUIUH9Dzo9WmdN18r
         r3XA==
X-Gm-Message-State: AAQBX9cTtqYJN4x3tWUtzC0F2tLfrdoxrDYwwab+ya1L0oAxN1nJxBTC
        BFS3wa38Kl7+n1EOxgmftiU/iUsxqWy/68DJpCE=
X-Google-Smtp-Source: AKy350YibgRgb9sIiYtrSA3BqsPmJ+XsScK2P+gSvuEkworRBgH+4OIRqNiq20c5bctw0bWeBIuncg==
X-Received: by 2002:a17:906:ecf4:b0:930:2e1c:97ba with SMTP id qt20-20020a170906ecf400b009302e1c97bamr37859577ejb.5.1680546904762;
        Mon, 03 Apr 2023 11:35:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id xh12-20020a170906da8c00b00947ccb6150bsm4164275ejb.102.2023.04.03.11.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 11:35:04 -0700 (PDT)
Message-ID: <a785c232-a3c0-dea2-fc60-f8394c0db95f@linaro.org>
Date:   Mon, 3 Apr 2023 20:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V3 1/4] MAINTAINERS: Add fragment for Xilinx watchdog
 driver
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Neeli <srinivas.neeli@amd.com>,
        shubhrajyoti.datta@amd.com, michal.simek@amd.com,
        srinivas.goud@amd.com, wim@linux-watchdog.org, linux@roeck-us.net,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        git@amd.com, git@xilinx.com, neelisrinivas18@gmail.com
References: <20230331074117.356339-1-srinivas.neeli@amd.com>
 <20230331074117.356339-2-srinivas.neeli@amd.com>
 <d9aade73-1bce-c2a3-f9da-883a5388527f@linaro.org>
In-Reply-To: <d9aade73-1bce-c2a3-f9da-883a5388527f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 03/04/2023 20:30, Krzysztof Kozlowski wrote:
> On 31/03/2023 09:41, Srinivas Neeli wrote:
>> Added entry for Xilinx xps-timebase watchdog driver.
>>
>> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
>> ---
>> Changes in V3:
>> -None
>> ---
>>  MAINTAINERS | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d8287eb2ab4a..4ed139d56913 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -23071,6 +23071,14 @@ F:	Documentation/devicetree/bindings/media/xilinx/
>>  F:	drivers/media/platform/xilinx/
>>  F:	include/uapi/linux/xilinx-v4l2-controls.h
>>  
>> +XILINX WATCHDOG DRIVER
>> +M:	Srinivas Neeli <srinivas.neeli@amd.com>
>> +R:	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>> +R:	Michal Simek <michal.simek@amd.com>
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml
>> +F:	drivers/watchdog/of_xilinx_wdt.c
> 
> Your patchset is not bisectable. These files do not exist.

Ah, I was too fast in judging this. It seems you document existing
driver, although nothing in commit msg suggests it.

Best regards,
Krzysztof

