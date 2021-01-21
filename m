Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9652FEB52
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Jan 2021 14:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731743AbhAUNPm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Jan 2021 08:15:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731732AbhAUNPW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Jan 2021 08:15:22 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702FEC061757
        for <linux-watchdog@vger.kernel.org>; Thu, 21 Jan 2021 05:14:42 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id v24so2428010lfr.7
        for <linux-watchdog@vger.kernel.org>; Thu, 21 Jan 2021 05:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7WhDYHGatB/2fJ84TYkwR2bHfKk3YQA5kHvYxOP9pUI=;
        b=PDM86Pvc5BIx/CgmfIVb2zj8qduUY4jS2Dad+MflKrcjLv53lxZs4WdImpHLeiIatI
         123CIxftakEQ6n0K4EN5k8x1UM9Whywwny9e7OQEc8K3dqJwhRcOd06mFwMp0Sy5V+0H
         DrER7L4nIG0Tsh2YDwilmzS1gwIlnWq8KIwhCKohUDick3XEz4TTXJ9WNmdzYZF+zOvh
         PTQT0UK72ULSRu1q7B9fJxKa740uIQoYhE2MI4mIR3iTOU2KorpTMoX6YBycv8enE0gc
         rUXFqxJBS6LHW/4DtkoSfswEJvLw6XI3rAnIVvwE2xseoD8vwU1oF/vYiqL8eP1BSCOY
         v2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7WhDYHGatB/2fJ84TYkwR2bHfKk3YQA5kHvYxOP9pUI=;
        b=LE95lIJPtI1QslkHbGS9Px9K1sDX1vIGUtiH5KnIx7iMYlb2joByZxh0jmhz/YiW7h
         XMvghjWXOp94SzUGh9XZ0HXJmpz7nZXTsSbMvtmt0Ap5drOW/iIcoTLUFEC3bkhncQAE
         srYW6sIDsiA+AYjXgFpHftZ+F40/rYNr8tjipyPUK6JJHKHiDJtqGeBpFvSqkmqJM6Yy
         /EYXGjMF8ETFMdjcbqZ02PNVFR8RnGYcGkhPG0fUTa78qJJhj1bVlT/UIv+3VstWoSqw
         7iVIRoskhJ4Er908C53GUqBNF34rUUDDpH83pcNBitVe3MJFI6kF9Sr52ulsea89f5SC
         VUsw==
X-Gm-Message-State: AOAM530yWxOs00l83MxTOOj5qCafgmOrEFtRIDLAvBlAgYrkrn4bUedR
        MxwgvW2a+W4s7kmzs7JmOn8/5S0bTE4SR+trNpGqZ0zvEW+oAQ==
X-Google-Smtp-Source: ABdhPJzX5OEuHG39nSXa8fVE3LqQ+FqhQx9j0neb3l27AjHf91ct5iDaXgV0ncFcF0R5akfj/VeW1VZsL8qtEKXr2Vs=
X-Received: by 2002:a19:8bc6:: with SMTP id n189mr6431666lfd.291.1611234879540;
 Thu, 21 Jan 2021 05:14:39 -0800 (PST)
MIME-Version: 1.0
References: <20210120162745.61268-1-arnd@kernel.org> <20210120162745.61268-6-arnd@kernel.org>
In-Reply-To: <20210120162745.61268-6-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Jan 2021 14:14:28 +0100
Message-ID: <CACRpkdaBLij-NoTXU8HJkeQWwN9QwTDV_1u4U4vVwqXPt-A0HA@mail.gmail.com>
Subject: Re: [PATCH 5/5] watchdog: remove coh901 driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jan 20, 2021 at 5:28 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The ST-Ericsson U300 platform is getting removed, so this driver is no
> longer needed.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
