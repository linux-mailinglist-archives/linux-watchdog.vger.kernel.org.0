Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF9942CF67
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Oct 2021 02:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhJNAIC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Oct 2021 20:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhJNAIB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Oct 2021 20:08:01 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180F3C061570
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Oct 2021 17:05:58 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id o204so6074040oih.13
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Oct 2021 17:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uNfwzFNvmx05GmDtkyQKuM/x1uxuQ0MHeZSc7gx4TR8=;
        b=Jb2menZ/kME5jJNuICt1A5K4DK6Zns+yQbFyECAWYd8yAVkr35OTtedlVrSvZlYaEA
         ZTfmje51HVDA5Qru0jJMjPT8d9kMDv2mS9fdD7oosIvvizdCzRfro2et4sL4BbUr6CG/
         Q1lTpV61c2HBzREd3z+SmJUk5E1Qrz2wBlo/tGNlHq3OIi0fiuNTljVGNbhTxCRTf4fL
         tTmKDEayj+NlifidsYGj+j46Arn1DIjzD1otfGYDV4Vpj/Y4yXuUofV2+kkpMlWTKvaI
         pjnusyCL22fG/fgwMeRWTEuGH3Am2555I4Llnx6RjzRSfuyOxfs/YFgxyptwrfYwtW/3
         otFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uNfwzFNvmx05GmDtkyQKuM/x1uxuQ0MHeZSc7gx4TR8=;
        b=LusVsCMHlXrWlv902R4PYbggJKJhNNx9K450KCZ21cbliw3C28HuL6HQYuEDanX1Ll
         iN33fHoB3KvGqAR0+VAIXOEU701bwxtT5soV/Ogmj2i6IrbAjDym5+8LJN7yRj+aiF+e
         lpfgRMkPThyRd2Pis7YzQIK/CXdqFsYV0JjNSwEYfw8BSrhuel10kmt4aimbZye67CyI
         PvH1dEq6OhJhfJVLwr0bikSJOwT4Tr4+Cwd3X28c69SX4122knbIo1GFN5zMYfhHKBjg
         NtkbFwEVn1VraHgsm20kBIX5/HxNxpomrJ6QiUQzGQCUul6LpTCPbLvkSwMr7fXq+Ooa
         5IaQ==
X-Gm-Message-State: AOAM533js16m5x2zICnnGSM3mjm2PrIGA36YnLWzWZg/jpWXlZcIjphx
        kNqssXuI7CJNH7V+msexz8L0RjS/BxU=
X-Google-Smtp-Source: ABdhPJyaRpcaJPPgL5c7neJ3kZr2oAKuaUAQpy7I/H4bK8KFFRsH4lXgmEo7ggFA6D3/kOgHF6Re/g==
X-Received: by 2002:aca:4444:: with SMTP id r65mr10942238oia.25.1634169957438;
        Wed, 13 Oct 2021 17:05:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 12sm221824otg.69.2021.10.13.17.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 17:05:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 3/3] watchdog: db8500_wdt: Rename symbols
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
References: <20210922230947.1864357-1-linus.walleij@linaro.org>
 <20210922230947.1864357-3-linus.walleij@linaro.org>
 <CACRpkdZOLZQRJsbuAhF-YLhob_SBHZP=o55bYfrkg+6FVf3gbA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <8d50d15d-21e9-3cd0-900f-db42a2776fb4@roeck-us.net>
Date:   Wed, 13 Oct 2021 17:05:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZOLZQRJsbuAhF-YLhob_SBHZP=o55bYfrkg+6FVf3gbA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/13/21 4:19 PM, Linus Walleij wrote:
> On Thu, Sep 23, 2021 at 1:18 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> 
>> For conistency and clarity, rename all symbols and strings from
>> ux500 to db8500 in the driver.
>>
>> Cc: Lee Jones <lee.jones@linaro.org>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Lee could you ACK this one?
> 
> Alternatively you can merge all three into the MFD
> tree since Guenther ACKed them, but they mostly touch
> the watchdog tree.
> 

Either way is fine with me.

Guenter
