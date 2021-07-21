Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 268B13D0A0F
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Jul 2021 09:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235919AbhGUHLm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Jul 2021 03:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235784AbhGUHKr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Jul 2021 03:10:47 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2292CC0613DB
        for <linux-watchdog@vger.kernel.org>; Wed, 21 Jul 2021 00:51:14 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id r17so1335561qtp.5
        for <linux-watchdog@vger.kernel.org>; Wed, 21 Jul 2021 00:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fPh5HDaC3NW63sKOep74w/15dkj23GMomTPo2I4GDhw=;
        b=GeesXmQG+7CVMQ6QTsIDB+/F52PWxosGClYlRK86JCSRPaEo9A097xHaGPOsY098Gy
         xrWTrFFlK11otZlGua6ezmKIjD3Hezx1tprVfiZ/iG5dP6sXc6rZXW36KaeLfqAsDpdz
         Est8nIU8s8G2ugeReNJgIqUZptBTIdytVztczNJenUOGfAH9MD7xY5VugeKAbbgB03dt
         dKCNWlvTWBXssbyrIiEVaAzb4cLFsnWzTTKjKRi+IGvcoY+CHa5amWDwr5AZ8itI3E8w
         D1i+AQHH2HU7DrlShG/wUfyPHh5iNyAGsbNTnnfjmT0cEvdHmft2lvwZnm7DjfnAsygc
         T2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fPh5HDaC3NW63sKOep74w/15dkj23GMomTPo2I4GDhw=;
        b=Mx9SJIIIr9g0nNrz98WJQ4nTDCR/+0YsaDFF0aCdB/YEo9zjOS5PWUun0E0vCEKGVO
         2vOOaQUs7IiwnTyIXCKUo8Fbw7HLYWaEUbk9Lul2ZSsfOOXXmlW6THJ05vt+y8uCzLgs
         wzi1zUtNqjwmP3goIGLwTTJqoVk2hGmLMqPDcFDMc5KE+3g7uJqedHaBz39KuX5QW/RT
         IV9TeQNiFJy2bD6ZZBtoHg1M3vIDd1UifJJiBjnVKKZ6CEgMcHd2FeHJbwQ7MvWcoWRg
         w/0IjBwl62JVcILVfJkQL7Lnpo/vuBg/xuAKeZt4urfHOG2jkUpu282izGHjQFtTHYAK
         czBw==
X-Gm-Message-State: AOAM530L1nnSP6T5ANhZLIv6LPZO3Hc7JtDQt7ITokWMp1zrGUu39BvU
        UdcopYEZfJPUPFc8jWrJZHwT39IEY3pmw22oDoe3LA==
X-Google-Smtp-Source: ABdhPJxuzYwcKE9v7oGs3UREu1WAf08RLSGca69xQOyr3PRedUcyn2cJAVDrjrhmRHUPOnTskWIHCnDMDsvvQnUrlK8=
X-Received: by 2002:ac8:5645:: with SMTP id 5mr30183956qtt.200.1626853873268;
 Wed, 21 Jul 2021 00:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210618195033.3209598-1-grzegorz.jaszczyk@linaro.org>
In-Reply-To: <20210618195033.3209598-1-grzegorz.jaszczyk@linaro.org>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Wed, 21 Jul 2021 09:51:02 +0200
Message-ID: <CAMxfBF7tQunNenizu5U+tF8aYQdVii=o_f2VcrT5fK7t-bzaqA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] introduce watchdog_dev_suspend/resume
To:     wim@linux-watchdog.org, Guenter Roeck <linux@roeck-us.net>,
        shawnguo@kernel.org
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 18 Jun 2021 at 21:50, Grzegorz Jaszczyk
<grzegorz.jaszczyk@linaro.org> wrote:
>
> Hi All,
>
> The following is a v2 version of the series [1] that fixes system hang which
> occurs when the ping worker fires after wdog suspend and before wdog resume.
> This happens because the ping worker can issue low-level ping while the wdog clk
> was disabled by the suspend routine (accessing hw wdog registers while they are
> not fed by the clk).
>
> To overcome this issue two patches were introduced. Patch #1 introduces pm
> notifier in the watchdog core which will call watchdog_dev_suspend/resume and
> actually cancel ping worker during suspend and restore it back, if needed,
> during resume.
>
> Patch #2 introduces relevant changes to imx2_wdt driver and notifies wdog core
> to stop ping worker on suspend.
>
> [1] https://lkml.org/lkml/2021/6/15/542
>
> Best regards,
> Grzegorz
>
> Grzegorz Jaszczyk (2):
>   watchdog: introduce watchdog_dev_suspend/resume
>   watchdog: imx2_wdg: notify wdog core to stop ping worker on suspend
>
>  drivers/watchdog/imx2_wdt.c      |  1 +
>  drivers/watchdog/watchdog_core.c | 37 +++++++++++++++++++++++++
>  drivers/watchdog/watchdog_dev.c  | 47 ++++++++++++++++++++++++++++++++
>  include/linux/watchdog.h         | 10 +++++++
>  4 files changed, 95 insertions(+)
>
> --
> 2.29.0
>

Hi,

Gentle reminder about this patch-set. Both patches were reviewed by
Guenter Roeck and are on the list for some time, I would be happy if
we could get them applied.

Thank you in advance,
Grzegorz
