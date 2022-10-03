Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 978BC5F28E0
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Oct 2022 09:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbiJCHA1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Oct 2022 03:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiJCHAU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Oct 2022 03:00:20 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7FC13D22
        for <linux-watchdog@vger.kernel.org>; Mon,  3 Oct 2022 00:00:14 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id u26so6616249lfk.8
        for <linux-watchdog@vger.kernel.org>; Mon, 03 Oct 2022 00:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=vmX/+5akulDOCofIBHD+M8QnLzZXAedqVxnThx38IY4=;
        b=fuX9+4t9ZGOXAgE6XMgw+mjIIdS5blIto35t4y0d84ktX+02fOHMFdAsQE6pP9w9I1
         pXHgYsIX20ykr/GklszG1CNTIbTp40KPdGHVvnAT1n0rCHPop0u76Ntg0TMjP1qMlVK2
         +ZY/fi9hWQ50YC5MxhDntNcMXwFxhUuY4izI6oZiEfoMDfflkkhaaShINj1autH5R3ka
         tl9nTkMT/u2cvU5Ozxu2k7/mtzyGz9BTnfZP+d+7SIFW6XXL1e6hA/VUZUB1pDQxU/hf
         PTehFFKs2SUtsWBH49kcN47E/Wga0In87bsJGN64EhcNmi+nAj8r0bGkQ5FUSiyW15tG
         QDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=vmX/+5akulDOCofIBHD+M8QnLzZXAedqVxnThx38IY4=;
        b=aWo9/uiSQq5m1Iz0C0eKeUWY8D466MEzVXHUm6+WwbuuLAacY8vjCAOsXTRu2S+4mo
         7m0ncVgsvBjaRrDeFN+OSl9xiqqyIVzgY501PdWGPR0HOzNT9IK8vTnkLeDvENLsHORn
         6AOebbLEzfK5u4Cw6HTUUkK2Y4e7z4WC2/cyGQEkwd996ez/MYAhSzVwnL4a6sEreVUl
         Ue6o81Iqfn8oyh7+SPl6Kt1wKkya6GsIb9s/lbS8A7V7JKtfsT3sPsKs61Ikf4yXv01v
         MTFBiExCns/TKhkDJUBVFSD6xOUmJJCEN2esioB5g1lMFgCAMS1kZKztCAfQUxTCGmlf
         io3A==
X-Gm-Message-State: ACrzQf2aKQ4L/zWVoS8vmvJvSWgfwy4PGNTzJJz+Gzv9Mm+hY3TsviXh
        kun9mEugWU3Btm7I8gylGetkWQ==
X-Google-Smtp-Source: AMsMyM71h9ZWNt7tTqHQed1PvCu17KvvZrSjQpebtCZ580Hiifm5oPbO/Jdo2t2/bUxgw6iNZDFY+g==
X-Received: by 2002:a05:6512:3a89:b0:4a2:fbe:5573 with SMTP id q9-20020a0565123a8900b004a20fbe5573mr5038065lfu.546.1664780412454;
        Mon, 03 Oct 2022 00:00:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z13-20020a056512308d00b00499b57032c1sm1334433lfd.144.2022.10.03.00.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 00:00:12 -0700 (PDT)
Message-ID: <e92d1547-428c-0232-d769-9c342e3a0c88@linaro.org>
Date:   Mon, 3 Oct 2022 09:00:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/3] watchdog: xilinx_wwdt: Add Versal window watchdog
 support
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        wim@linux-watchdog.org, shubhrajyoti.datta@amd.com,
        michal.simek@amd.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        git@amd.com
References: <20220927110257.41963-1-srinivas.neeli@amd.com>
 <20220927110257.41963-3-srinivas.neeli@amd.com>
 <c1e34c50-50ac-0e06-3af7-a1eec886bf07@linaro.org>
 <1cb7fdb7-ebad-a61e-490c-80e6c9feab2b@roeck-us.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1cb7fdb7-ebad-a61e-490c-80e6c9feab2b@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 02/10/2022 18:29, Guenter Roeck wrote:
> On 9/30/22 03:35, Krzysztof Kozlowski wrote:
>> On 27/09/2022 13:02, Srinivas Neeli wrote:
>>> +
>>> +static void xwwdt_clk_disable_unprepare(void *data)
>>> +{
>>> +	clk_disable_unprepare(data);
>>
>> If watchdog is stopped and then device unbound, don't you have double
>> disable? IOW, where is matching clk_enable?
>>
> 
> After looking into the entire driver code, I see the problem:
> clk_disable() is called in the stop function. That is wrong;
> if the clock is disabled in the stop function, it needs to be

Yep. clk_disable and clk_enable are always paired. In probe they are
pared with remove() or reset-action. This one is in stop(), so it does
not have its pair.

Best regards,
Krzysztof

