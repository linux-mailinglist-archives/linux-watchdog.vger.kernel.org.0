Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69CC96A5A7F
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Feb 2023 15:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjB1ODc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Feb 2023 09:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjB1ODb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Feb 2023 09:03:31 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F181C33A
        for <linux-watchdog@vger.kernel.org>; Tue, 28 Feb 2023 06:03:29 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id o12so40365785edb.9
        for <linux-watchdog@vger.kernel.org>; Tue, 28 Feb 2023 06:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677593007;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tOSJ6umcOZA5CjUGiyBLVx5qUO7As8SlOyj3YKzeyGA=;
        b=vMEAwTDHGxtNiHIstWX9O4/Qc+j3JpDj8jIp4Ui9bfcB6A3JdYU5/juL+MSluiobSO
         LXQmuxdHun72mIGZejPqHAGjXKPFGBT4tGDwDflwHz1W+T5J4E8hwGur8kNskWZAcFGh
         KhwmqXn23rXf3oatc9zydMto00qyiETBmW1CPKaG7NoHmQULeGFRHGaCh3CRtMauTDUp
         w8KNVdgViH5yMEel5uAM/Y3nMxBrzZemRzM6r2ZuOfNrKvFgVbr3qysykocqp0ogR0y7
         3aIn2ShfFkH+m00LEYfanUhNocfZEw9zH5RhqJJt9w/ffBKN826ZL3E2ytWM86oaeJ5w
         az3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677593007;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tOSJ6umcOZA5CjUGiyBLVx5qUO7As8SlOyj3YKzeyGA=;
        b=vK9rvJYS4LeTb369ENqcVcq4fQpkQ3BFfkejTZSdKC7OxEBqDCpHRc54BSrMu6P+2Z
         ITChDbKgx5N6e1yigvVymIdr9bhARO3ZzqlEvTJCNSrKkLbYDnqr3FY+H7bpF9iEiQxg
         aht8kv5JQcz+5bz2m+e2/FO6Ah8q0h/tJ42SejV85hdht5n7BOlmHAEwlIkajJ8+VVPG
         cq3UtGaj8lXEVJfv4dMLKPsURZgqi7jBnPJt1SwEXhPVKa2OPG9QsxF41UvXwWr1Qkvs
         OXzVXUOIpgRb3n7JJT8fZ83/02Pk6gr9WPbIWcylWi2MVn46mV9VlzI6mcB+jcgAt2Yu
         KtUw==
X-Gm-Message-State: AO0yUKVVWLOm31yL7tmGlACo1BE11ZQTOmtiLRZzsXsyrFIJ38G2DFJv
        MlXn6MD2xqLTOUyCsMStkHnSvA==
X-Google-Smtp-Source: AK7set+dumf3UHtLmRhYjVhZb6oiDxoCBxZsl+O0HoDiARM7jnxwQwI7aKhclSInAOmneYFVjwWZ0A==
X-Received: by 2002:a17:907:3e25:b0:8ed:a0ea:29ee with SMTP id hp37-20020a1709073e2500b008eda0ea29eemr14754489ejc.22.1677593007619;
        Tue, 28 Feb 2023 06:03:27 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id os6-20020a170906af6600b008f7f6943d1dsm4487936ejb.42.2023.02.28.06.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 06:03:27 -0800 (PST)
Message-ID: <f91f6784-15f5-1911-1101-1fe8147f9a38@linaro.org>
Date:   Tue, 28 Feb 2023 15:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] drivers: watchdog: Add StarFive Watchdog driver
Content-Language: en-US
To:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Samin Guo <samin.guo@starfivetech.com>,
        linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20230220081926.267695-1-xingyu.wu@starfivetech.com>
 <20230220081926.267695-3-xingyu.wu@starfivetech.com>
 <CAJM55Z823iqUqD8enM0qJ_MA3Tw94Mn0mq71fbLT1Qjo2s2J3g@mail.gmail.com>
 <0ffb02d2-0bbd-fd0d-b0f6-cb5605570050@starfivetech.com>
 <CAJM55Z_hRpUYueZ-XuWUx1NfAsL9E+-4ry9TYeRWM_bKXvym-g@mail.gmail.com>
 <Y/3coFvMWOLaaY9p@wendy> <545c23f3-1d68-2bff-89d9-584e3ca31044@linaro.org>
 <Y/3hVlp/YPnWHDCX@wendy>
 <f9e380f6-334f-11fa-1118-8d6c3c9befaf@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f9e380f6-334f-11fa-1118-8d6c3c9befaf@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 28/02/2023 14:16, Xingyu Wu wrote:
> On 2023/2/28 19:11, Conor Dooley wrote:
>> On Tue, Feb 28, 2023 at 11:57:58AM +0100, Krzysztof Kozlowski wrote:
>>> On 28/02/2023 11:51, Conor Dooley wrote:
>>>> On Tue, Feb 28, 2023 at 11:36:49AM +0100, Emil Renner Berthing wrote:
>>>>> On Tue, 28 Feb 2023 at 10:44, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>>>>>> On 2023/2/26 22:14, Emil Renner Berthing wrote:
>>>>>>> On Mon, 20 Feb 2023 at 09:21, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>>>>
>>>>>> So the dt-bingdings need to rename, and which one could be better,
>>>>>> 'starfive,jh71x0-wdt.yaml' or 'starfive,jh-wdt.yaml'?
>>>>>
>>>>> Sure, starfive,jh71x0-wdt.yaml sounds good to me.
>>>>
>>>> I feel like a common comment I see from the dt folks is to not put
>>>> wildcards in filenames & just pick the first compatible.
>>>> I could very well be wrong on that front though...
>>>
>>> First compatible is a bit better, unless you are sure this will cover
>>> all such compatibles now and in the future. For many bindings the
>>> family/wildcards were fine in filename.
>>
>> Ahh cool, good to know what the specific policy is - thanks!
> 
> If this watchdog driver is improved to also support JH7100 in next patch,
> it seems more reasonable to rename the dt-bingdings to 'starfive,jh71x0-wdt.yaml'.

Bindings are for hardware, not drivers. One version of driver in one OS
should not determine the bindings...

Best regards,
Krzysztof

