Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D752326792
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Feb 2021 20:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhBZTyC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Feb 2021 14:54:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhBZTyA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Feb 2021 14:54:00 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA3AC061786;
        Fri, 26 Feb 2021 11:53:20 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id z126so10936626oiz.6;
        Fri, 26 Feb 2021 11:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fhZMDDNAuvyoi6Q1oQYjvRFeDXsfEhM3TJa22IcYiiU=;
        b=Gsfu5OB/Czx81TfcU31Iu65nK2fWkuRSetI/XguUwNafQRQFSkYozK6b3IGVBh6NeY
         OHe3JqX/mfyFIXN1cOxb8g4ydP4UyVEpfFF5zbquu8CKiqK87OdpdYUJv9NS+RDI6I34
         52uY+lQwJpE40xSTwI1LJzMiFE9sgNM+A4847QzBYg1AiNOeSzyiWoCigfDCmgkVWP6R
         eb9MSZ4Y8tZ/lKgs+5+p+LAlTI14oB+JZsgEz6WG58GLA2xx99nWpQWy0tE06dqhwzA/
         gyZFEX97ONctcDTIeAKPk2zS2YlWk2QdKmbEQBd5qk26SnnQYXpRUsVqfC/XlBdDBvV0
         L/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fhZMDDNAuvyoi6Q1oQYjvRFeDXsfEhM3TJa22IcYiiU=;
        b=YVBx0nulFJ2Pi+hT2zqk4KYa5KqVHUhH1ymwdkl8o/IDm1wYj/6+zxg7vyqevnYjxT
         kESWlAKB/3jXBDG4IyWyKwHZd5M73VAMxv7Lt9nySGY6HQyFeQ6Bc6egEW59WLag+8kV
         wcr6izLVHuvobnElXVVJW5tN7xLrHWCl/URM9lJMHHYX+gUPxWEiU1TICcfpCuPLtokk
         44ZKHKiqI7YL48zNiloErzygeunkWaE5AM1P8/Cco+4PyTp9cHF4GbF/sHUIP+r93gWx
         zmnPR7S/g1enVMJEb4Czfg2kf7suTyq8uq2epai6xBeijdVFUvjZvs0NSpTCHWYQZtUT
         5Fjg==
X-Gm-Message-State: AOAM532PCdJYu2wk3k5ppMB29lyZM6UxPrf+zjJ+joF668376PSak+wx
        OjgdYLP2tQj/p5PHRRev8bExpa38Pjs=
X-Google-Smtp-Source: ABdhPJw6dPs0c2oc9wOPM339L6g0LJMKPzrvodWTNcQSMtwTMzgygZQxqVzaK9fDw96VTnJvhxSe1g==
X-Received: by 2002:a05:6808:8cb:: with SMTP id k11mr3243253oij.151.1614369199004;
        Fri, 26 Feb 2021 11:53:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f29sm1929789ook.7.2021.02.26.11.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Feb 2021 11:53:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 0/2] add ripple counter dt binding and driver
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-clk <linux-clk@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
References: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
 <CAK8P3a2=nZ3bbeguXjbFrhz0nWeUOcLM7mRudhPDrcb+jZ4VvQ@mail.gmail.com>
 <e5fd7ce3-3ba6-e5de-1cbc-fa31bd46942c@rasmusvillemoes.dk>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <2208f466-e509-6bbe-0358-34effb965610@roeck-us.net>
Date:   Fri, 26 Feb 2021 11:53:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e5fd7ce3-3ba6-e5de-1cbc-fa31bd46942c@rasmusvillemoes.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/26/21 8:35 AM, Rasmus Villemoes wrote:
> On 26/02/2021 15.35, Arnd Bergmann wrote:
>> On Fri, Feb 26, 2021 at 3:14 PM Rasmus Villemoes
>> <linux@rasmusvillemoes.dk> wrote:
>>
>>>
>>> So I'm thinking that the proper way to handle this is to be able to
>>> represent that ripple counter as a clock consumer in DT and have a
>>> driver do the clk_prepare_enable(), even if that driver doesn't and
>>> can't do anything else. But I'm certainly open to other suggestions.
>>
>> How about adding support for the optional clock to the gpio_wdt driver,
>> would that work?
> 
> I think it would _work_ (all I need is some piece of code doing the
> clock_prepare_enable(), and until now we've just stashed that in some
> otherwise unrelated out-of-tree driver, but we're trying to get rid of
> that one), but the watchdog chip isn't really the consumer of the clock
> signal, so in-so-far as DT is supposed to describe the hardware, I don't
> think it's appropriate.
> 
> OTOH, one could argue that the watchdog chip and the ripple counter
> together constitute the watchdog circuit.
> 
> Cc += watchdog maintainers. Context: I have a gpio-wdt which can
> unfortunately effectively be disabled by disabling a clock output, and
> that happens automatically unless the clock has a consumer in DT. But
> the actual consumer is not the gpio-wdt.
> Please see
> https://lore.kernel.org/lkml/20210226141411.2517368-1-linux@rasmusvillemoes.dk/
> for the original thread.
> 

Sorry, I am missing something. If the watchdog is controlled by the clock,
it is a consumer of that clock. What else does "consumer" mean ? And why
not just add optional clock support to the gpio_wdt driver ?

Guenter
