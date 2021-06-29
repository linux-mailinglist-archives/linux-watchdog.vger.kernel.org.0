Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C30693B6C69
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jun 2021 04:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbhF2CQJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 28 Jun 2021 22:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231398AbhF2CQJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 28 Jun 2021 22:16:09 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E68C061760
        for <linux-watchdog@vger.kernel.org>; Mon, 28 Jun 2021 19:13:42 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id s19so24784628ioc.3
        for <linux-watchdog@vger.kernel.org>; Mon, 28 Jun 2021 19:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rcncWXlDetcYOR5cxpoHR6LBZHK6k4JsfTUcGr7lEAY=;
        b=oH0bBjWOO81W8a/L6iXurUAI6ixFtjz6ToQGhDLBOmO7m0qNn2JY8imwqEqkUOsJgb
         EE/p8bWvP7ak+HW/yUa7XkN0wziLHFqgZiJSSL6UULw1Fp/eDk+sB+njiA4W5jLyLh5m
         e8NW3GqJ7oR14mpH+E4/IxYmmAVxiCfsohMNN1MqK4jtimirxaBEfUKyq7jOzrRODKTg
         QwDn6pYZ7qNnFDLc47E/L4bKxpCylujJdIlXVihpxnRNY3vdTqjfeuitvCKuCxkRTQ2q
         nqtCp3ULPQmKpxG2AS05R+byNzKj7KZhAwVAgOiDkQcKh6FNTA04MRyZEaOfv4BBcZyU
         XiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rcncWXlDetcYOR5cxpoHR6LBZHK6k4JsfTUcGr7lEAY=;
        b=YaZxdoE+A3p+nuU91QGJQQ/G8CJGb3yFm6beLSyhbctM7WpunubTOUjJ9HbkYISjuI
         V0w483QFar2rXoJv2G3+qDLE8iHjipgND+dphHG9icBplkFOz96TF0UG4Cgvjujqz6hD
         FrTWUrz71niJmRIJSPsSKGhMe6a6vCA9UP9CaU5aIi03YzItgtbnKKVJil4wCHjVwCma
         JNDWeMuDidTvQVR8aJVGleBlCkcHMypTo6azezF/5xmKD/egeVIOVNuZMl+V4ZB3Ps9u
         GP7itOgpJ4llpUpi/tIM7R7dtJbRtpZjEQjZy0RY1byNIohZ+iguGKBNIjXVWHSJeMc9
         MuKQ==
X-Gm-Message-State: AOAM530tnkJ2Cq0C7q1mxLe7V/omxzz9PyhLB66YCKulenjfhPGZ5dsY
        n1wcwddrdhsgNy7LfnyedH62f5hQFtB+sCEaBIrc0g==
X-Google-Smtp-Source: ABdhPJx6MW16x6OLxQk6NypGbyMZlz+0sgCozwnDG28+XM6Z/8kDLeMpPr0LcPhWAxEg/47OFX21/HUOVP6vp4W/Ol4=
X-Received: by 2002:a6b:2b04:: with SMTP id r4mr1928898ior.195.1624932821270;
 Mon, 28 Jun 2021 19:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210628113730.26107-1-Christine.Zhu@mediatek.com> <20210628113730.26107-4-Christine.Zhu@mediatek.com>
In-Reply-To: <20210628113730.26107-4-Christine.Zhu@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Tue, 29 Jun 2021 10:13:30 +0800
Message-ID: <CA+Px+wUDSDjLo4qePN=o6JPb=Tv=y4vqZqjFO2ZBEPJrF8sxKA@mail.gmail.com>
Subject: Re: [v5,3/3] watchdog: mediatek: mt8195: add wdt support
To:     Christine Zhu <christine.zhu@mediatek.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        matthias.bgg@gmail.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        seiya.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jun 28, 2021 at 7:39 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
>
> From: "Christine Zhu" <Christine.Zhu@mediatek.com>
>
> Support MT8195 watchdog device.
>
> Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
