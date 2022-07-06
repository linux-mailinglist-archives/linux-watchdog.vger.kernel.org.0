Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE042569052
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Jul 2022 19:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbiGFRJ0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 6 Jul 2022 13:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbiGFRJ0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 6 Jul 2022 13:09:26 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341461EC44
        for <linux-watchdog@vger.kernel.org>; Wed,  6 Jul 2022 10:09:24 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id r81-20020a1c4454000000b003a0297a61ddso11975043wma.2
        for <linux-watchdog@vger.kernel.org>; Wed, 06 Jul 2022 10:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=5LUOM8ZYJNqDNXNRkK8SW6v1KeODGn/t/tSrSeB93Hg=;
        b=FWxQ9w9QQNjX8fhNNM4ShlZTIrizS+PKUFTG21pr1iRgQ7Vf64He23QLE9Bp6vZC9d
         QZu2/gYfSpYUu+IGln2mRJLyYTBfq/2oQnalM/9l2402od6QikiGfzuLSKyyHtUvM0ND
         H8c1Ve5FE8EFWb3V5w4SgEjotxtGfnYtzZH/0u8do8Ur8T0RcZirfEQuMgVoNg6hEjJl
         IFvuFdAFs7G+vCfMwzF+R9e5ptnM53k9g6vDUW9c9MrHQ6945QoFT/IiVHoXUxXm909V
         DfjWv/xGi1nJsBJDn0frsfD/P79LZl9yDkDVyV2rDWgVln6fVNSHmzJB+nvuFcX8uCDE
         vGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=5LUOM8ZYJNqDNXNRkK8SW6v1KeODGn/t/tSrSeB93Hg=;
        b=i3uoiSXfkDGA/AZPYwNWqxa/r9ei3uVdUa0iy2OSL1t3pLdOdftgHBLCyIsB9XSdSi
         WmLz9NCLmZEg8odvhGtWT0rKJDLLaVMlIFJw9Ii059WO/1wLIfMl0KokP4JuGbvyWak4
         4uQ8uLgg+k1mBW3h4fEb/ygdYkmnEr0zkxuaTO4e6Nqni10YM/e5E3Xl+nb8w0zGIC6t
         iwM37tuV85a1ryGKzbNAl4kPw1PDBj/qMZUrIfXfDgxtGb/riCn0xGfxZJ4KaYq2rGAN
         2py6oL7RZJK/5581B9y8c9e2krre4NuG8x2leT7deDUZ/UxTNWxPkesR/M1XhiuHnjNI
         YgyQ==
X-Gm-Message-State: AJIora8QYIxKnkAc49VEKtIBc08QJP9G4jp/nJps3aDQ3ceX7UIJISvH
        vZrioP9t2bBfXk/Xm40EDdu7xg==
X-Google-Smtp-Source: AGRyM1tDs+r809drkm9fTo8mDedQDX5NO3elMnVmkCGdj1wZQpsTYCLXuaPJsjJ/fdV04pS7uHNxFg==
X-Received: by 2002:a05:600c:1e14:b0:3a0:2bba:4b2e with SMTP id ay20-20020a05600c1e1400b003a02bba4b2emr42964111wmb.196.1657127362770;
        Wed, 06 Jul 2022 10:09:22 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id m16-20020adfe950000000b0021d70a871cbsm5605291wrn.32.2022.07.06.10.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 10:09:22 -0700 (PDT)
References: <20220705142444.17063-1-pboos@baylibre.com>
 <f756b2d5-56e7-6e52-2739-eca4bb33508b@baylibre.com>
 <1jmtdnwd7y.fsf@starbuckisacylon.baylibre.com>
 <20220706124139.GB492220@roeck-us.net>
 <1j8rp6z720.fsf@starbuckisacylon.baylibre.com>
 <20220706164325.GA776177@roeck-us.net>
User-agent: mu4e 1.8.3; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Philippe Boos <pboos@baylibre.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] watchdog: meson: keep running if already active
Date:   Wed, 06 Jul 2022 19:00:39 +0200
In-reply-to: <20220706164325.GA776177@roeck-us.net>
Message-ID: <1j4jzuyxq8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


On Wed 06 Jul 2022 at 09:43, Guenter Roeck <linux@roeck-us.net> wrote:

> On Wed, Jul 06, 2022 at 03:24:27PM +0200, Jerome Brunet wrote:
>> 
> [ ... ]
>
>> 
>> No worries. That being said, I have gone over 
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst
>> 
>> It just says that Reviewed-by sent on the list should be collected for
>> the following version. Nothing against adding the tag if the job has
>> been done, on or off list. Same goes for Suggested-by, Tested-by, etc.
>> 
>> If I missed something or it is non-written rule, please let me know.
>
> Your interpretation is quite a strict one. I don't think there is a rule
> that states that tags not sent to a list must not be collected.
>
> Anyway, I would have called it common sense, especially since it does
> happen that someone accidentally hits "reply" instead of "reply all"
> and replies end up not being sent to the list. If you expect me to dig
> through e-mail headers to determine if you meant your tags to be published
> or not, sorry, that won't happen. Do not send me e-mails with any tags
> unless you accept that they may be published.
>
> Guenter

Exactly. Not expecting anything. I'm 100% aligned with you.
Maybe this is where is misunderstanding is.

The Reviewed-by was there when Philippe sent his mail.
I was meant to be there and taken. Plain and simple.
No other expectation whatsoever.

I'm not asking for the tag to dropped, quite the opposite actually.
