Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F86A4A2AF8
	for <lists+linux-watchdog@lfdr.de>; Sat, 29 Jan 2022 02:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352003AbiA2B2g (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Jan 2022 20:28:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344738AbiA2B2f (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Jan 2022 20:28:35 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F079FC061714
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Jan 2022 17:28:34 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id v186so23689185ybg.1
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Jan 2022 17:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YnL408yl5E7oe6lK7AUbaC/GDNScIkIXY9EvlQAW0Ao=;
        b=eqVF1lg3pgzakXT6xOZkIF2xXDPP6UxE3KR/JV3NGoqMX7vhjSbcveki1nyWgAWu4R
         eldMyOl0RfxTIW/myUjNNSHiAyuVXyU4vrr5xoU4tYDKIt8aDEqKIvd+dSzAh35Jzs+l
         HiM4COEvb3q5jSMslPPyhDPcO0a/Yv7jvJa78gScDhIBuR+sY/xes1i0uIKvXALYzpBW
         HP35tOO3xD/RsmLS/E/XY5LAkVvvZGqiYaH8c1nVEhF7djFkdbxc2gfVYYP11c9Nq+sZ
         2HqadhG+K2u0VAlnWB2//JiSWoBlSWlL/vgA+qRRi0jIXr/hGoJrmYx9IYcGo/z56N+u
         BfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YnL408yl5E7oe6lK7AUbaC/GDNScIkIXY9EvlQAW0Ao=;
        b=Xvj/pxC4ORnGTiLZWCtWwUxMt96Dm4qDxzOMKDzb91DXpxMPlT9MEUDwq5sXVrg4RR
         s3cyMvdSC5DBG2QcUjsDHvjjbl+CfG5IhB+H2hA6XXiieXe+M/IE23iDLLjHOmjyltXG
         EjeXkS9dny6BxmcopthFHHSZD912QXJ3is8sJFULm2v1h/h2gwmyZjIo5Fa5xjg2iqzG
         hoyTSOFe9BtlkwGhFpDMbs3Zhgb+UH+anIuAADJb/YGwrZxagf30r9+AJXota4mxZIpc
         xVk7+O8R9JmgJi0AhUpv7d6e0N5yXE7+he4aHEC7R9cKBLwG6uRu6MRb9U/3AgVxUjUx
         aoSg==
X-Gm-Message-State: AOAM5333i9LQi9TEgmXztm9kNiDhDrAUxaTRjgwIfInsqir3fR+mxS7j
        9gNAcMFW5T8Ij1ofbrK+zbz4Z0zTRpjdoTi8eSGVmQ==
X-Google-Smtp-Source: ABdhPJyOxR/hLfY/YW/CPAAvPyRzF39DSYZYHe8e6GLXH7Udm3NqkrcFJgLx5/dxpfnPIxL/ulmqAmeeGzOHj1EKjOw=
X-Received: by 2002:a25:8c3:: with SMTP id 186mr15532059ybi.587.1643419714207;
 Fri, 28 Jan 2022 17:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20220128204856.494643-1-clabbe@baylibre.com>
In-Reply-To: <20220128204856.494643-1-clabbe@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 29 Jan 2022 02:28:23 +0100
Message-ID: <CACRpkdavwgUxGtraAphscqMBvram-=g_quy0+7x33ZQStZgzFg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: watchdog: convert faraday,ftwdt010 to yaml
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     linux@roeck-us.net, robh+dt@kernel.org, wim@linux-watchdog.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jan 28, 2022 at 9:49 PM Corentin Labbe <clabbe@baylibre.com> wrote:

> Converts watchdog/faraday,ftwdt010.txt to yaml.
> This permits to detect missing properties like clocks and resets or
> compatible like moxa,moxart-watchdog.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>

It's fine if you also add yourself on these, the more maintainers
the better.

Yours,
Linus Walleij
