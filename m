Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5A223348E4
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Mar 2021 21:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbhCJU1i (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 10 Mar 2021 15:27:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231512AbhCJU1Q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 10 Mar 2021 15:27:16 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0663BC061756
        for <linux-watchdog@vger.kernel.org>; Wed, 10 Mar 2021 12:27:16 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id t5so1479470qvs.5
        for <linux-watchdog@vger.kernel.org>; Wed, 10 Mar 2021 12:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NjeHyvZMbZGJ8OEzLSik+NBjkSDo6JPO/IsATXTAv4U=;
        b=HqjgsGqmuDSGg/MeVO8mxOU3yiE7d6qGOOsFAoMQmWI/ZpLuOC3B3KDsNgAVmp1HEP
         I9teL1AcZ1SkgrbgstvsGH9yxsotjqYeZjCbqYMZcbLKvBYghiYTHElgDN1hIsSLWdZX
         v5PPGjpkNnOgUjrXWbCYWccvWjR0lD1duMzNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NjeHyvZMbZGJ8OEzLSik+NBjkSDo6JPO/IsATXTAv4U=;
        b=GIpUsxK17jqGuChmnI6oL03O8x/Reqg7+RLSReuJserlUAvMdUmGHpcTXuS+ZBDFzR
         ndjFcGwtlU4DQoS+je7Z3vyEK8IRyZGfeHB5WvnXFl5ZexDcCnAr5JT2jj8+oEgOEcqs
         dxbVmyFE2ACu6BWS6R1mqVN+8r1DR+STqFZm5QoGn6GrFybmAzrY9TFWkkHrO7ETkvHW
         LrJKOJXo7kAFvnPwZ4N1AapHEmFr38rZuWPkrbJvYUS9A3EH4aUYjWfsecKCnHSKJDP4
         3/5NEdNZEcwWWYs65k+4PPQfS/swvm5KXvymuV85o1pjFshFZvy94QJ070Yec0iddLaH
         d9+g==
X-Gm-Message-State: AOAM532NjtrOup0omXKpeIUOISAlBZI0VRJws3xoUpD1cg30ybW5SGDt
        pz991S1yhgcd2XUgXYGolfHXdCyVewJ7xw==
X-Google-Smtp-Source: ABdhPJxgqltf/gkSx9M0RGMSDHX1TfYpHOGqYLE/5xXCCehPoO/y5FYfEPothcfV5a9dbHVMzTPeWA==
X-Received: by 2002:ad4:4c4c:: with SMTP id cs12mr4500670qvb.35.1615408034780;
        Wed, 10 Mar 2021 12:27:14 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 30sm253173qta.38.2021.03.10.12.27.13
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 12:27:14 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id c131so19238198ybf.7
        for <linux-watchdog@vger.kernel.org>; Wed, 10 Mar 2021 12:27:13 -0800 (PST)
X-Received: by 2002:a25:9348:: with SMTP id g8mr4388320ybo.343.1615408033534;
 Wed, 10 Mar 2021 12:27:13 -0800 (PST)
MIME-Version: 1.0
References: <20210310202004.1436-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20210310202004.1436-1-saiprakash.ranjan@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 10 Mar 2021 12:27:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X-nZu1VTJdLOiXmtC4HrnK85KK=KqYe-9szX2LiJoo-Q@mail.gmail.com>
Message-ID: <CAD=FV=X-nZu1VTJdLOiXmtC4HrnK85KK=KqYe-9szX2LiJoo-Q@mail.gmail.com>
Subject: Re: [PATCH] watchdog: qcom: Move suspend/resume to suspend_late/resume_early
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On Wed, Mar 10, 2021 at 12:20 PM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> During suspend/resume usecases and tests, it is common to see issues
> such as lockups either in suspend path or resume path because of the
> bugs in the corresponding device driver pm handling code. In such cases,
> it is important that watchdog is active to make sure that we either
> receive a watchdog pretimeout notification or a bite causing reset
> instead of a hang causing us to hard reset the machine.
>
> There are good reasons as to why we need this because:
>
> * We can have a watchdog pretimeout governor set to panic in which
>   case we can have a backtrace which would help identify the issue
>   with the particular driver and cause a normal reboot.
>
> * Even in case where there is no pretimeout support, a watchdog
>   bite is still useful because some firmware has debug support to dump
>   CPU core context on watchdog bite for post-mortem analysis.
>
> * One more usecase which comes to mind is of warm reboot. In case we
>   hard reset the target, a cold reboot could be induced resulting in
>   lose of ddr contents thereby losing all the debug info.
>
> Currently, the watchdog pm callback just invokes the usual suspend
> and resume callback which do not have any special ordering in the
> sense that a watchdog can be suspended before the buggy device driver
> suspend callback and watchdog resume can happen after the buggy device
> driver resume callback. This would mean that the watchdog will not be
> active when the buggy driver cause the lockups thereby hanging the
> system. So to make sure this doesn't happen, move the watchdog pm to
> use late/early system pm callbacks which will ensure that the watchdog
> is suspended late and resumed early so that it can catch such issues.
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/watchdog/qcom-wdt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
