Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E33315F241E
	for <lists+linux-watchdog@lfdr.de>; Sun,  2 Oct 2022 18:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbiJBQff (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 2 Oct 2022 12:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiJBQfc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 2 Oct 2022 12:35:32 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120A433E2D;
        Sun,  2 Oct 2022 09:35:32 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id s206so7943002pgs.3;
        Sun, 02 Oct 2022 09:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=qj8zrinpD53YrPC+7Y0Z8sstYQxviHw1lkUeDrL18TM=;
        b=H6LRrJHWaeEEIHZKk1wQMC4mLg4QSvZNhJ1jn3/QKj6smGXZFGmlVxT2haBRk5D8nB
         Y0tXGTALmm2IdX3i2vciGrAcMkWKsISeXUJVEZC7EHdm7j/JRfY0lIGzgo+m+t6Sdvya
         tGnqcM5KEROjRudi9Tj6xQIVx3yyxmM+CANtZOqz2/r0rC3t2O4+zPgJGjG+yTXD/Kc+
         YAjenmGaxJg7lvgex8gzM350VUdDyRiPrQb85fy/j2CXKQs2YTe83IYYzhLxqB/B5ZBV
         JTkqf+ednXxvuM+RoVtEJPEHVW69yHBi7hep5I1yzX12W3+Sk5gZxYW3aHeg3i2B3hpj
         OWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=qj8zrinpD53YrPC+7Y0Z8sstYQxviHw1lkUeDrL18TM=;
        b=04QE6GmO0ZN+Pkbe7DlZv2eUSZkksnq0ypawYT8KacJKt1bLr8PnqE0yDjn/xeuuaY
         nowcC8MLYk0FgEv8sybe4JyB/vE4cWoWREReQOmlqM0wHVtH0ymh1ADOuCxIAbZbkLOd
         nVmwhS18knQ0nU2FCLTKbG7fgVd/N8Izywvv5WSburs21yJE1vPGXxSFugGLiZcua70O
         nUaORvZNRawtbqS5w4g961eNNc5jLocJM8xWgZKnAzxYj0GzC4nob7k7dylFjAmQ+i5a
         CCnzwwJ+tqYwvkoxzfOa5taq7/rVzq38gT0/F+FGTQ1okzantyZuZYxKFiGIPl1bUElr
         mT/Q==
X-Gm-Message-State: ACrzQf0AbxUEQ3UFoYfPo9P0JCmOEBNQztCBun5XGnICMr5zNf1V6wSR
        SnpuY3jPDXOSxo3VXoghvqQ=
X-Google-Smtp-Source: AMsMyM7dvtVU6XGeMWVblmVHB3jBR8Y4xUlr6klRvb5qPIlPMAiVBYqXgMt6ygVPu0+xyATZNAbWjA==
X-Received: by 2002:a05:6a00:10c2:b0:547:4991:c985 with SMTP id d2-20020a056a0010c200b005474991c985mr18846688pfu.67.1664728531588;
        Sun, 02 Oct 2022 09:35:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x125-20020a626383000000b0053639773ad8sm5612416pfb.119.2022.10.02.09.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 09:35:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <37986fbb-0c7d-ef87-200c-6f6ff49a8414@roeck-us.net>
Date:   Sun, 2 Oct 2022 09:35:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RESEND v2] dt-bindings: watchdog: migrate mt7621 text
 bindings to YAML
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-watchdog@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        wim@linux-watchdog.org, Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20220926162549.805108-1-sergio.paracuellos@gmail.com>
 <20220926211508.GA682626@roeck-us.net>
 <CAMhs-H-j34cfv1rJ=fUKhQrZ5FwSJezZFnw=esh4MPNw+zNUNA@mail.gmail.com>
 <CAMhs-H_hPsLZh9YrckPzOqx4NOPKAc8OGeHmerpsHABs0L13Fw@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAMhs-H_hPsLZh9YrckPzOqx4NOPKAc8OGeHmerpsHABs0L13Fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/29/22 10:26, Sergio Paracuellos wrote:
> On Tue, Sep 27, 2022 at 10:24 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
>>
>> On Mon, Sep 26, 2022 at 11:16 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On Mon, Sep 26, 2022 at 06:25:49PM +0200, Sergio Paracuellos wrote:
>>>> Soc Mt7621 Watchdog bindings used text format, so migrate them to YAML.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>>>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Thanks, Guenter!
>>
>> Rob, I don't know why this patch is not in devicetree patchwork list...
>>
>> Please let me know if you want me to resend this again.
>>
>> Thanks,
>>     Sergio Paracuellos
> 
> I guess this patch is supposed to go through the watchdog tree??
> 
> Thanks in advance for clarification.
> 

Normally patches like this would be pushed through the watchdog tree.
I added it to my watchdog-next branch, and usually Wim would
pick it up from there. Note that I don't really care; either way
is fine with me.

Guenter
