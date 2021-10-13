Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B7E42CF1C
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Oct 2021 01:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhJMXVl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Oct 2021 19:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhJMXVl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Oct 2021 19:21:41 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA41C061570
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Oct 2021 16:19:37 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id d3so16567599edp.3
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Oct 2021 16:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oRLQbbWkuCJo1dk8dp/HdlO0ZgXNy9YCqassLDMsQn8=;
        b=ackCGt0rbqjuwbKomIs1badaiidnP70DGqcOg5ntu8pm4+d2h80qOxGzw27TnPnodJ
         OzcClMJz4vrh5s1KDzY6Kqd84tzpSU1A3+anbXDy0TpZ0NHRBE77kaPUDWXPY0um5MRA
         nSifZ5H38kErewyYE31iK/H+bMQ3eDmxTU+f1aGTX7C1UIaeT483A9PutQBihlGpGF4A
         6emXatA+jEGNdkh142Aq9TgCwnPzhNHSvKOWb2fkq5YYyQCW+oB8OfJ7rhupJhyF8IwK
         KtAXuGPCsp82hsi/dLGJAND3A6A9+IYpgtEmqni5z6T9T3Mxh23GFeG5t4qYFShgze75
         yn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oRLQbbWkuCJo1dk8dp/HdlO0ZgXNy9YCqassLDMsQn8=;
        b=gNLoBQNVixXkoElN39vR5bJjYY4kNPUGR1+TlvWd2WGRMo3FqsREcNvhDdg+Y3mVOO
         OsY5xUM9lWPTBcLecuo2GEbC4tnlYeBMV7V8SI6rU7XBTnD3xjBrDR5OdWBw10lhnQqj
         wxrpRw7GWbdKpITB/RlkEGTAiGUOp4btZ43U8Y+0Jsmc3Xr8hOPYpRDpDDQwoAsqt+Vl
         5UgZDIHsV1/0QIufFDLm76GRSwqgR6IdO2GYg8NGGCQrxN/LRP4ZA7LQ67CwiKnsU4RK
         UAL5kRLlST8L9xFpXppFfwwev8Q3jhcBkHyPrvSZjgQkJ/NzWRuCyowobf3768d+QlAy
         /Sfg==
X-Gm-Message-State: AOAM532HOAEt3EhZORVWa6y+eKKDQaVX1Ex/wwuXLFo+dvwmda+15wyZ
        wn5LxOTTrRDfhEUnwWI76j2fCZYiIWpROyqNjOEViQ==
X-Google-Smtp-Source: ABdhPJz79rT0ZmLd8koxIIlFsjv/0/HuVbdnS62mjQrtQRHCmd0jMGJpDliOuwEgK+1V/Qa5XKIDKwyvn5av8nsb+To=
X-Received: by 2002:a05:6402:34f:: with SMTP id r15mr3497586edw.111.1634167175891;
 Wed, 13 Oct 2021 16:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210922230947.1864357-1-linus.walleij@linaro.org> <20210922230947.1864357-3-linus.walleij@linaro.org>
In-Reply-To: <20210922230947.1864357-3-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Oct 2021 01:19:25 +0200
Message-ID: <CACRpkdZOLZQRJsbuAhF-YLhob_SBHZP=o55bYfrkg+6FVf3gbA@mail.gmail.com>
Subject: Re: [PATCH 3/3] watchdog: db8500_wdt: Rename symbols
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Sep 23, 2021 at 1:18 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> For conistency and clarity, rename all symbols and strings from
> ux500 to db8500 in the driver.
>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Lee could you ACK this one?

Alternatively you can merge all three into the MFD
tree since Guenther ACKed them, but they mostly touch
the watchdog tree.

Yours,
Linus Walleij
