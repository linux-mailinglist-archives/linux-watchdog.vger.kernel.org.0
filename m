Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89E84748E63
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Jul 2023 21:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233169AbjGETyP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 Jul 2023 15:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232036AbjGETyO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 Jul 2023 15:54:14 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B47F81723
        for <linux-watchdog@vger.kernel.org>; Wed,  5 Jul 2023 12:54:12 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fb5bcb9a28so11063737e87.3
        for <linux-watchdog@vger.kernel.org>; Wed, 05 Jul 2023 12:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688586851; x=1691178851;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iOuiLENnGJgQP5T14AdW9obiAm8decWJr19hpHUhp5E=;
        b=OPknQAecTBe/Xh5gFz9jDtpV3Y6WgMyalt02IsNwPhUqagLGAJUkjct/bN7GjNQ90Q
         Bl4Bj2JGhZj/ioBO6zdwjNz8d3RLmn1FZLNaLRvQAW4n0jRyLpLEkm/0G1RTryTp6P6J
         SCzZX34M0HlPEjMly4V7c1aK3L1s81ddmwHJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688586851; x=1691178851;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOuiLENnGJgQP5T14AdW9obiAm8decWJr19hpHUhp5E=;
        b=J1ABUXltjWntqBmNY8jonu1IFHV1oNolrlqnD1QcVlvqU9ZSmpq8xKUL0HXBa+qUdL
         UPajQLUEHrw7NpOYXi5kbB6qGHp+VWDXh+CukRhAOeF65P5AFB5jpwn6Cz+yk/xnNeRx
         cQEy0domHbuyA5YpkNeeE7SMO8GKbqMSwjOgRtsnCxzisZx0HxiMv/YM4cDaQ+iXTyqf
         EB3kzsBE1Gp+TdrZt2vdfIzTLW3HLfvrYemWZr5WxYOmFYDjjbK9F4Xe1niaiCxwUzrV
         h44cyP6sGcod5782yeV3NndcSaRjWIUKxO3KClMEm6D8aj5G7sXdFqPO8kdcdDjCFSrp
         zo7Q==
X-Gm-Message-State: ABy/qLY/M0TUAcEnlkMjN7u/Jt/Ub0zpdSy+k1SzBwff+wn6UM1GKc7p
        xuu+f94W4vWvwmt57NGXWYpDZ9mVR8E8niGhrovfmKMJ
X-Google-Smtp-Source: APBJJlGbyk7yVlaR200W7RBmGnECdhUs6soUiCMYVWGlAIR0iEQlrZnsDkHorWUlZklEvBF0rlDX7A==
X-Received: by 2002:a19:790f:0:b0:4fb:92df:a27b with SMTP id u15-20020a19790f000000b004fb92dfa27bmr9980lfc.39.1688586850853;
        Wed, 05 Jul 2023 12:54:10 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id w22-20020ac24436000000b004fb7cd9651bsm4644474lfl.98.2023.07.05.12.54.09
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 12:54:09 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso11077029e87.0
        for <linux-watchdog@vger.kernel.org>; Wed, 05 Jul 2023 12:54:09 -0700 (PDT)
X-Received: by 2002:a05:6512:3607:b0:4f6:2317:f387 with SMTP id
 f7-20020a056512360700b004f62317f387mr12679lfs.35.1688586849377; Wed, 05 Jul
 2023 12:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230705122357.GA14855@www.linux-watchdog.org>
In-Reply-To: <20230705122357.GA14855@www.linux-watchdog.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 5 Jul 2023 12:53:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgu6wv3aMx-p-tapvZ4ui7SSzo3OX_tz7jA4rggCfsk-Q@mail.gmail.com>
Message-ID: <CAHk-=wgu6wv3aMx-p-tapvZ4ui7SSzo3OX_tz7jA4rggCfsk-Q@mail.gmail.com>
Subject: Re: [GIT PULL REQUEST] watchdog - v6.5 release cycle.
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Yuechao Zhao <yuechao.zhao@advantech.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 5 Jul 2023 at 05:24, Wim Van Sebroeck <wim@linux-watchdog.org> wrote:
>
>   git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-6.5-rc1

I think that machine is feeling a bit sick. I just get "Connection refused".

           Linus
