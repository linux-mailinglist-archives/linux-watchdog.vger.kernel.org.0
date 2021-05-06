Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B102C374D4B
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 May 2021 04:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbhEFCLX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 May 2021 22:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhEFCLX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 May 2021 22:11:23 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E797C061574;
        Wed,  5 May 2021 19:10:25 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id u25-20020a0568302319b02902ac3d54c25eso3604288ote.1;
        Wed, 05 May 2021 19:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ze8nHKCTJVPZAxcqvpeEarc+m37v3jnk/1brv6JR/yY=;
        b=Gh02vDtS3vVZBZrxQ2uZZWT9rXIwcfGmEiDhAXNKbS+6OH7HHljuhLFCb+8ldMvtme
         bypprO29OhPi12CKA8ueXpH1LxUgnLpv/kY5p5udC7x+VWBKsAKV4egY9iix6sLA7rcu
         ohgurC4HoMCZZiCLJKPE/WiETqKpVNSfxSPKYVIJERSxz7HaunNfIVp3Iaaco/2UVP6F
         jek7vBZPuhEc1SO2xBYG0SyitOkAywkdUBA2aU8Rg5+kF52GdH5z5/ps//Iu0oOI53Fw
         Ri8M07RORs0i3Buk2SDVXvQ3RgxPkJk0z415ws73Q8CnQD1wmNV/Fw3mwEfizLMrC1m4
         hC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ze8nHKCTJVPZAxcqvpeEarc+m37v3jnk/1brv6JR/yY=;
        b=dS7TPrqJ1VxTFAjog0t3Hm7GBVWESKmbwkgk9xTG2Ue0qm87FufTgRS+WmzzOQ0UnA
         r8QLCLc2P6SnvdlJWwqNjOuMRjD/fJQ1YhWo5+ROHc1XAVqEr5vEUKvYT8JeCTCtln+k
         o3SYC+YP1UmpMaIBuUDL8ifAeEG5EkJDeYIepBe3QXiEgN1Q5rCL9OgrWyBhAhktQMky
         aqCtpMB9wzAuKIECDZJkDsjA/C1holvTdL8mOrqPJIL/FgmqzEYR/42QinAPMJlz0wku
         8tkYvzBcMx52ee/NhU+jbxayvlx/dFF+B3+G7qDlvgpBMRj+BfE+fuHTBCiQDanBjF0y
         VX0g==
X-Gm-Message-State: AOAM530eVQpQno4OnkeDmZT7694UZfYfFU6qc0xqHn0MXJYEnZtYZxk9
        pKBb4+z98HB2wDzcHkPyzRx3nD1I4jw=
X-Google-Smtp-Source: ABdhPJyDfe/Vr0bIlEEgW1QLVfnkxK0Q+Ez92Z9YkHkRYyp/EYkR5hYMfsCyXLmT+HGErWJNF6gEGQ==
X-Received: by 2002:a05:6830:411b:: with SMTP id w27mr1398308ott.80.1620267024455;
        Wed, 05 May 2021 19:10:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x18sm199395oix.28.2021.05.05.19.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 19:10:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH V9 1/2] watchdog: mtk: support pre-timeout when the bark
 irq is available
To:     =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <APgAqgAuDm48oWX*tq6AkKqd.3.1620265890239.Hmail.wangqing@vivo.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ac2a3762-0b5d-a406-33e0-fca3073cd5ac@roeck-us.net>
Date:   Wed, 5 May 2021 19:10:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <APgAqgAuDm48oWX*tq6AkKqd.3.1620265890239.Hmail.wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/5/21 6:51 PM, 王擎 wrote:
> 
>> On 4/24/21 6:52 PM, Wang Qing wrote:
>>> Use the bark interrupt as the pretimeout notifier if available.
>>>
>>> When the watchdog timer expires in dual mode, an interrupt will be
>>> triggered first, then the timing restarts. The reset signal will be
>>> initiated when the timer expires again.
>>>
>>> The pretimeout notification shall occur at timeout-sec/2.
>>>
>>> V2:
>>> - panic() by default if WATCHDOG_PRETIMEOUT_GOV is not enabled.
>>>
>>> V3:
>>> - Modify the pretimeout behavior, manually reset after the pretimeout
>>> - is processed and wait until timeout.
>>>
>>> V4:
>>> - Remove pretimeout related processing. 
>>> - Add dual mode control separately.
>>>
>>> V5:
>>> - Fix some formatting and printing problems.
>>>
>>> V6:
>>> - Realize pretimeout processing through dualmode.
>>>
>>> V7:
>>> - Add set_pretimeout().
>>>
>>> V8/V9:
>>> - Fix some formatting problems.
>>>
>>> Signed-off-by: Wang Qing <wangqing@vivo.com>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Note that the version history should be after "---".
>>
>> Guenter
>>
> 
> Thanks, Guenter.
> And what do I need to do if I want merge into the next-tree?
> 
Wim should take care of that.

Guenter

