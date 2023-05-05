Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABB26F80C7
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 May 2023 12:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbjEEKb7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 May 2023 06:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjEEKb5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 May 2023 06:31:57 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2BB9160BF
        for <linux-watchdog@vger.kernel.org>; Fri,  5 May 2023 03:31:55 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-965e93f915aso61740466b.2
        for <linux-watchdog@vger.kernel.org>; Fri, 05 May 2023 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683282714; x=1685874714;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tss2iYAogsWUkj4oYWrGVmAbKaoB0zM9wE54WqqKd0Y=;
        b=tNSLEHALkywvpQv1FwYipENAvoPjczA7Bxx9bEuVPexutY+1UE6shZWOfe6kxdOOx5
         NQhDYrsjGsweQxlbK/FNWZ0+G8/OtTI5nDyyp5kcxr1qEUW1+3Ddzs7JSliBN49Gj4lT
         ZgzYPu1u/GpfxnPcQ19UEjA5bWdBrPUpZMQqy75M/1a4oQmSUdydgQfClCWE7idFvvP1
         Ib0KLpn11BbAw6m5k9hgP2KTmWXZ1B62LdU0tkzWK/BYMvvPXRNw2PRa7ESEfpglOz2t
         Zv1pWH4qxSKjyFgBv0fvQ/+UrS9TJd+u9AKYwk952IllAO8MwF6cY3KcqTEEcSv8Yl+H
         IEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683282714; x=1685874714;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tss2iYAogsWUkj4oYWrGVmAbKaoB0zM9wE54WqqKd0Y=;
        b=ZxEE4E4AbaywoAbxUBnxvuFejdKNFewyyT8B35P0JVWwaJchmQHd+rN0XAipbTZ5xs
         BdspTXwLRPlS98HRJPROinuWfiXCjVaDy5SPM+CR1O2uq2F8yOSgCc1gMY8Mo2pjeBEu
         svdLLigjTq96Ygj2hG9lP/Er0a6PgsxAt2hDWg94joFzFevhWToiVjplGs/xwehuf/8f
         m0oPlVAMWSJHnyFej30k5Kvyic/4YSla0E8HpqvE2FmX+XZllr+9GEK1S1c9yXujGYO4
         hgiYivRt6kIBOF91dMBe4xJkMUaTeWwxdp3qvAani2U1N1RKxvkYdvhqNRDJ1XUxkgVK
         7SUg==
X-Gm-Message-State: AC+VfDw6bjG2JL47UVisMFbC/9ancHI2Nbw89EbQZCxxO8a0WSlu9e2V
        4o/2qEaQ1YHTbYK9gl2MlWMPjQ==
X-Google-Smtp-Source: ACHHUZ6Aww/tkHL01E2blbKoNpK2dQxvdbFSq2DqZgWwrWJths3LOb5cIJUBfPMQ90i6K+u007ymwg==
X-Received: by 2002:a17:906:d550:b0:94e:ffab:296a with SMTP id cr16-20020a170906d55000b0094effab296amr851246ejc.73.1683282714213;
        Fri, 05 May 2023 03:31:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id bz6-20020a1709070aa600b0095850aef138sm763402ejc.6.2023.05.05.03.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 03:31:53 -0700 (PDT)
Message-ID: <b0a97e91-aba3-f624-2b8b-a82462bfe2ea@linaro.org>
Date:   Fri, 5 May 2023 12:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [EXT] Re: [PATCH 1/2 v5] dt-bindings: watchdog: marvell GTI
 system watchdog driver
Content-Language: en-US
To:     Bharat Bhushan <bbhushan2@marvell.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <linux-kernel@vger.kernel.org, sgoutham@marvell.com>
 <20230503121016.6093-1-bbhushan2@marvell.com>
 <9911bb17-e8f7-b552-7056-a26b3194c416@linaro.org>
 <DM5PR1801MB1883A469C355797CE4A6E83CE36D9@DM5PR1801MB1883.namprd18.prod.outlook.com>
 <bb52dbb7-7225-552c-2daa-688aa304a9a0@linaro.org>
 <DM5PR1801MB18835D6D376910DA60B36D5FE36D9@DM5PR1801MB1883.namprd18.prod.outlook.com>
 <e1760ba6-4200-4fa0-5298-f76575522764@linaro.org>
 <DM5PR1801MB1883331A14517B4268D07E41E3729@DM5PR1801MB1883.namprd18.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DM5PR1801MB1883331A14517B4268D07E41E3729@DM5PR1801MB1883.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 05/05/2023 09:17, Bharat Bhushan wrote:
>> Same story every time... and was discussed many, many times on the lists.
>>
>> https://urldefense.proofpoint.com/v2/url?u=https-
>> 3A__elixir.bootlin.com_linux_v6.1-
>> 2Drc1_source_Documentation_devicetree_bindings_writing-2Dbindings.rst-
>> 23L42&d=DwICaQ&c=nKjWec2b6R0mOyPaz7xtfQ&r=PAAlWswPe7d8gHlGbCLmy
>> 2YezyK7O3Hv_t2heGnouBw&m=3aeejmHQ5C8TyLM5odlaq6KnLYHt4PhpJp70FQa
>> qbNf7w15KFHA3fmeDR2V-en4m&s=FKeW5tpOG-
>> CJoV_JKuqTa0k_tRrYWAQZG1UfqlW3c74&e=
>>
>> You need anyway SoC specific compatibles. Once you add proper compatibles,
>> you will see that property is not needed.
> 
> Looks odd to add N number of compatible for N socs belong to one class of soc, but anyways will do.

Why this is odd? How does it differ from other SoCs?

Best regards,
Krzysztof

