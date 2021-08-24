Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4710F3F6142
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Aug 2021 17:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238056AbhHXPHE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 24 Aug 2021 11:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237966AbhHXPHE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 24 Aug 2021 11:07:04 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE9F9C061757;
        Tue, 24 Aug 2021 08:06:19 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id i3-20020a056830210300b0051af5666070so37144677otc.4;
        Tue, 24 Aug 2021 08:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=atzFJRXRbCbQFJp+Cx+oxoNlg0fdbGcCA11T+Oo8BfQ=;
        b=rcMgLQ/niWzQ63BA59QilTaas8j32JoOgGcgNT+tsSgfqFJ1WRBukFpKrazCE+Nvxb
         +FU9JyWunrSUSAp2sQuKjnhwFBmqKq4Q7BP+rfkFlDTwZcrOnDDNDJj1nyf8Dlbp3tpt
         TGH+trQWboaPiSN9SVpdSJhhMvbHVAnk/XajpFLbLlZIqeoemVHLu21RZTCwLQdh8IYA
         JifdjUAYwePcCGSuZ6KSSQrzElW3ZrUV0IQu6gNhIf0R1d0cLkIi1k6iWpaCSwvwdF5U
         Rs9cNX53+Mb3l43WYD+WSuPr3vCMR0xex1ksWDAAhlSIPGyRBXjR2mTg9WBGpd1xEl/m
         8pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=atzFJRXRbCbQFJp+Cx+oxoNlg0fdbGcCA11T+Oo8BfQ=;
        b=OJQzun3WrQkNlgEW9VlL4re45LuJUW83NwShAPW+AwrS+QPOY+ORTUSkrRh+8dKKrO
         1gRQoC7kQCy3lsKeB3STgIWugWJpCxus5DuoglyyA913YzKGlbwhxZIqYnHe/bIktQjx
         9mckWbrJmtDnNWhiuapn0DM10q92mBcDGoa+6so4SaanesAcvXRQfEfC3vUbuwakZTt2
         jaQ4vr3Yv514f6Ljd8az0Zr4uM4XWdnahUSOq5wMig917WmO4+I2FhIARnhu5D/WCEMn
         maN0H21KkiD89PQK82kxPKit16IMgOVwmIasZjXM86+it7tl20vLoOjclrjHkKRFSPy1
         PhFQ==
X-Gm-Message-State: AOAM533tXP1bHIEpIhkwZXU2Py6ViTMBlf3XFn07Bxo82nrSc0+uLJIx
        3qsDweRgxLoJP40Qp7UvLb0=
X-Google-Smtp-Source: ABdhPJwT1EFS3KoLFxituJ+ofchSqtIKpCCv/eOETdOlQdsZA4Hkq0g2vsZi1mRcstTmhpJpqAvYvQ==
X-Received: by 2002:a05:6808:208b:: with SMTP id s11mr3085370oiw.95.1629817579204;
        Tue, 24 Aug 2021 08:06:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a15sm4569159otq.13.2021.08.24.08.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 08:06:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 24 Aug 2021 08:06:17 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christine Zhu <Christine.Zhu@mediatek.com>
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        seiya.wang@mediatek.com
Subject: Re: [RESEND v8,0/2] watchdog: mt8195: add wdt support
Message-ID: <20210824150617.GA3394785@roeck-us.net>
References: <20210824062633.14374-1-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824062633.14374-1-Christine.Zhu@mediatek.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On Tue, Aug 24, 2021 at 02:26:32PM +0800, Christine Zhu wrote:
> Supports MT8195 watchdog device. Supports MT8195 watchdog reset-controller feature.
> 

The series is already queued in my watchdog-next branch; no need to resend.
We'll have to wait for Wim to pick it up from there.

Thanks,
Guenter
