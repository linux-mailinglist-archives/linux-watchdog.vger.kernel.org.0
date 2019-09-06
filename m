Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2C1CAB934
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Sep 2019 15:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390255AbfIFNZl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Sep 2019 09:25:41 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53392 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726949AbfIFNZl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Sep 2019 09:25:41 -0400
Received: by mail-wm1-f67.google.com with SMTP id q19so6503326wmc.3
        for <linux-watchdog@vger.kernel.org>; Fri, 06 Sep 2019 06:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R9GWG5wY/iepwMnyG4oYLLomYTv7fOjvDEM4YE/5Ts8=;
        b=vAvdYJHTPWzSQjVkZ8S3mi4tdcxieXnkxnzSfhP2tKQ07aoJyay8oAM3N8LX2DDdeJ
         DCE06I2ab8RqEeOVeVnDhMauiM4gh8gt96w/YnGxXJ/+BsNY98G6gi4zwXPUN1g4RTsd
         ZcpO1KjQv8z7bSlreJmtFPibmMF6H18mfnpf6IgdAYFCXSD5ehLFyAlVQYfnmAxGU8yM
         z5Ydjp1+KIS+UiUTA/TrSheKcR+XabuXOyFvBSTqA3UBd0mgX2D4x/zlqX1cyumY4b0t
         mU0qXqcIgMZTTV2wBHE1h0PyKmMKlKIFIpWAooA+QpCsCNnOEttaB/3zV1132+yy59d9
         A9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R9GWG5wY/iepwMnyG4oYLLomYTv7fOjvDEM4YE/5Ts8=;
        b=cTRQw37qT+pw3blfqQaW2NE5Dk56DRw+FngCIqQLMgoYElJuj70goDyYWFNvN1CtOd
         fw0sNTDqsMSEKf7VfFnIqk7VjcK+iFxtfxUFEnjyY80hDtyc9RUZhfNNcKV/1ey8e7W5
         khK/JJxwuFpuGpqzJGdYulVdtPP68+hnSWhTVXgaEIfm3FIW4sTCxmfTs53397FQ6zlz
         efnIepaxycv4QUuDtQc4uZswEPBTB+5yrmXG8I6MCwRduortajJsjX5eN9CLAtYA8Zkv
         hMTVgRSX1hl81FInEu/XUQeQQCEx+2kxf/Y+TG1AJWLTX3pL8oVGOLe4ezHaxT64dPEJ
         fqLA==
X-Gm-Message-State: APjAAAVb/3cTXh4yOH+5A3OYKRFuo02aHE5mOgoFF0q5BF1yqz9f0I1m
        Z8FfuUbjR/v/w6nQUzQgbFAqpA==
X-Google-Smtp-Source: APXvYqzv8i3XmPWmf2CAOvd7eCXPNRrxKC4w1pA8ySv9OMt4DOq/XTjB17qT9vFU+6GApqkJmHBlFg==
X-Received: by 2002:a1c:7f4f:: with SMTP id a76mr1096553wmd.117.1567776339388;
        Fri, 06 Sep 2019 06:25:39 -0700 (PDT)
Received: from [192.168.1.6] (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id d9sm2480551wrf.62.2019.09.06.06.25.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Sep 2019 06:25:38 -0700 (PDT)
Subject: Re: [PATCH v4] watchdog: qcom: support pre-timeout when the bark irq
 is available
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     agross@kernel.org, wim@linux-watchdog.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190905210035.9985-1-jorge.ramirez-ortiz@linaro.org>
 <20190905211913.GA31094@roeck-us.net>
 <68ca07e6-efa2-d5bd-111b-faaa86808192@linaro.org>
 <20190906125937.GA7255@roeck-us.net>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <3721c11b-6a18-9459-ef37-dccb0ffad198@linaro.org>
Date:   Fri, 6 Sep 2019 15:25:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906125937.GA7255@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


>>>
>>>>  static const u32 reg_offset_data_apcs_tmr[] = {
>>>>  	[WDT_RST] = 0x38,
>>>>  	[WDT_EN] = 0x40,
>>>> @@ -54,15 +58,38 @@ struct qcom_wdt *to_qcom_wdt(struct watchdog_device *wdd)
>>>>  	return container_of(wdd, struct qcom_wdt, wdd);
>>>>  }
>>>>  
>>>> +static inline int qcom_get_enable(struct watchdog_device *wdd)
>>>> +{
>>>> +	int enable = QCOM_WDT_ENABLE;
>>>> +
>>>> +	if (wdd->info->options & WDIOF_PRETIMEOUT)
>>>> +		enable |= QCOM_WDT_ENABLE_IRQ;
>>>> +
>>>
>>> Again, the condition needs to be that pretimeout != 0,
>>> not that it is supported.
>>
>> no I dont think so. doing that would propagate a possible error in some
>> pretimeout setup code which would end up enabling an interrupt when it
>> shouldnt. so I dont think that doing that would be correct.
>>
> If the pretimeout setup code is buggy, it needs to be fixed.

the condition whether to enable the HW interrupts (IMO) should be
controlled by the DTS as part of the static configuration.

> 
>> The interrupt should only be enabled if WDIOF_PRETIMEOUT is configured
>> (independently of the pretimeout value); as a matter of fact, if
>> pretimeout is 0, the interrupt will trigger at the same time than bark
>> (which is what the original code used to do).
>>
> The original code did not set bit 1 of the WDT_EN register,

sure, this is true

> and it did not set the bark time.

actually no, unless we are looking at different files, the original code
did set the bark time even though PRETIMEOUT was not enabled... so yes
bark was being set to bite. Maybe I am misunderstanding your point.

> 
>> so I'd rather keep this condition unless you strongly oppose to it.
>>
> 
> Please feel free to petition  to Wim.

I'll change to your recomendation and repost v5 - I thought
WDIOF_PRETIMEOUT was formally correct but functionally there is little
difference (if the hardware works as expected)

thanks for all your comments Guenter.
