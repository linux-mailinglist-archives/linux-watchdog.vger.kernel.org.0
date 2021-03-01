Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36FF327B0D
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Mar 2021 10:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234129AbhCAJqP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 1 Mar 2021 04:46:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:49874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234104AbhCAJpq (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 1 Mar 2021 04:45:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7292E601FE;
        Mon,  1 Mar 2021 09:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614591905;
        bh=+kVuRMmJFA3NeZk2H02s5z77HTpE92uBU8CQsiK21zs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LgMxrB4SnOanZzGeiI5celQIQV1vl6N9orOE5JGd/h5qiYvPQpkj/nr3ASZKtGnBj
         cHO72uDzTQ0VVPkY6iUDCCPGDK1bEKT7rSXxZQ78tbrROe/sk1Tpxu3Jks8k2kHUBK
         DWxtB6VmJWbtNoGI/q6E86+bd5PoUb8fLTuiPR6HFVVR6i7W7Yxw7iQC4FnSPmR5Eq
         ggL8W6JNfRZT1rSlwtSXZnx5K6mVJx0gR5GFJwQ8JN+1Q/ADEyIBqVxA9StpE5o32Q
         BZKximWs7IaSZjwOMFW5MEdd5sc9Pd7ZycWru39dYcFCby/rhegy1Y6j+FL7t0NaSf
         2ksqojn0V+gnw==
Received: by mail-ot1-f53.google.com with SMTP id h22so15858265otr.6;
        Mon, 01 Mar 2021 01:45:05 -0800 (PST)
X-Gm-Message-State: AOAM532E0dezNLa9zQCM9HAACx11SdCp86sH+6zjVXxmlTjL4cKrGQgJ
        mQbO4kNc6BdcDxj7mRTplq1SHP//g8FweEbYzig=
X-Google-Smtp-Source: ABdhPJxqvjLn6W5eFEMQcS7P3mahZ0tKYSfy6AiKZY4imuyX6VCPZwA1wKdoKFwqWARtFs6NqMB/I+f4BREMDuCxYOU=
X-Received: by 2002:a9d:6b8b:: with SMTP id b11mr12801036otq.210.1614591904691;
 Mon, 01 Mar 2021 01:45:04 -0800 (PST)
MIME-Version: 1.0
References: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
 <CAK8P3a2=nZ3bbeguXjbFrhz0nWeUOcLM7mRudhPDrcb+jZ4VvQ@mail.gmail.com>
 <e5fd7ce3-3ba6-e5de-1cbc-fa31bd46942c@rasmusvillemoes.dk> <2208f466-e509-6bbe-0358-34effb965610@roeck-us.net>
 <285d739a-b343-c411-5461-0fe1f44177a5@rasmusvillemoes.dk>
In-Reply-To: <285d739a-b343-c411-5461-0fe1f44177a5@rasmusvillemoes.dk>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 1 Mar 2021 10:44:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0tTQKZ6=55yCQx=60iBt1L6RZzzSvSJMmfKYUkgiWjrQ@mail.gmail.com>
Message-ID: <CAK8P3a0tTQKZ6=55yCQx=60iBt1L6RZzzSvSJMmfKYUkgiWjrQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] add ripple counter dt binding and driver
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-clk <linux-clk@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Mar 1, 2021 at 9:34 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
> On 26/02/2021 20.53, Guenter Roeck wrote:
> >
> > Sorry, I am missing something. If the watchdog is controlled by the clock,
> > it is a consumer of that clock.
>
> But that's just it, the watchdog chip is _not_ a consumer of the clock -
> I don't think I've ever seen a gpio_wdt that is not internally clocked,
> but even if they exist, that's not the case for this board.
>
>  What else does "consumer" mean ? And why
> > not just add optional clock support to the gpio_wdt driver ?
>
> Because, the consumer is a piece of electronics sitting _between_ the
> watchdog chip's reset output and the SOCs reset pin, namely the ripple
> counter that implements a 64 ms delay from the watchdog fires till the
> actual reset. (The watchdog's reset is also routed directly to an
> interrupt; so software gets a 64 ms warning that a hard reset is imminent).

I think it's  a question of how you look at what the gpio_wdt device is.
While physical gpio chip is not a consumer of the clock, I agree with
Guenter that the conceptual device is: The functionality of the watchdog
in this case is provided by the combination of the external chip with the
ripple counter. I think it is therefore appropriate to have the gpio_wdt
and the driver refer to the clock as part of the watchdog.

        Arnd
