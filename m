Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA8F257281
	for <lists+linux-watchdog@lfdr.de>; Mon, 31 Aug 2020 05:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbgHaDzR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 30 Aug 2020 23:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbgHaDzP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 30 Aug 2020 23:55:15 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79838C061573;
        Sun, 30 Aug 2020 20:55:15 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b124so2132200pfg.13;
        Sun, 30 Aug 2020 20:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wg8+XIELhXp1eOdAN1w0GvhqUi4hDTzyY8WpXV067qI=;
        b=ZIOAaWCIccTssd8TBtoljJNC1Zwi3xB+EeHq/60odFFAk7ap8xCAJCLbYzoAbM9EvE
         mCuNBS/ZLA3cCd8n52aUzN+tzrLAUvBdFMA4nUqWww9YaxhFy19cGGkady3n14TNgzg9
         oDs8yKQNE/djZPGM4NZJ2Pi1xMJcq0JKV+RTTKUo7F8cRWks/ZteMwSBnRA3fm/xzz/w
         piSw9yUeLiRZ1pDElxyt0aSPYoS+phKxHejB7BcahILkJERw3ec9FPUCcv3uo2+0j0XJ
         mqHT1RoewguMx6lHn5ht6MjWdLcyUuhaRisGZeQSXIAUxy3R2Pb3F7VjKogyYzAHbygE
         9tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wg8+XIELhXp1eOdAN1w0GvhqUi4hDTzyY8WpXV067qI=;
        b=QFq2I9oLsArhn7DQs5tGPYtjfCW0iFs+VSScHgSUBFmEq/qp6uak4UG9UBmhkjokrd
         lXiqwQW5BVCKct5z8JO0Soe95b8NCsk3+2gKiWrLRcmh1Lh6Tp3zSsGfcQzUEIBcdO7W
         edkvchKPizqKyAdS1I3DSHNdDu3YdH1WWsC5iHR5HkS89fUzvXpuFo9gi6c8qzNRkLsF
         nNoBqvzOr2Dt+cfjONYyd60cx2FkK8Pl8XxwI6j0YluBVM+z7oFWWqN5I9cfIDvh05CS
         SbdvSjJFRdnh3PtNTmL99I5HR79qwm5pEx6rWuUuD1Yui9KftECIAiC2ql+kFxtxzMTX
         zkJg==
X-Gm-Message-State: AOAM5323XrtSUy5iRBlj+YBKB3O0lE7KhILH7DdSur/WvxAz4LEUJF1U
        1WhBaoPrRhhiPfNccVhDOmpMAkLmb80=
X-Google-Smtp-Source: ABdhPJw99fF7LlZyPCLHC4RpRR0gK4EMFXPGa4u154dgttVI2xu8puoWvDDlaHgC3hUpn/X2w8NA8g==
X-Received: by 2002:a62:7d51:: with SMTP id y78mr7931535pfc.182.1598846114937;
        Sun, 30 Aug 2020 20:55:14 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id p9sm5602658pjm.1.2020.08.30.20.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 20:55:14 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     bcm-kernel-feedback-list@broadcom.com,
        Andre Przywara <andre.przywara@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH 08/10] ARM: dts: Cygnus: Fix SP805 clocks
Date:   Sun, 30 Aug 2020 20:55:06 -0700
Message-Id: <20200831035506.1332109-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200828130602.42203-9-andre.przywara@arm.com>
References: <20200828130602.42203-1-andre.przywara@arm.com> <20200828130602.42203-9-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 28 Aug 2020 14:06:00 +0100, Andre Przywara <andre.przywara@arm.com> wrote:
> The SP805 DT binding requires two clocks to be specified, but the
> Broadcom Cygnus DT currently only specifies one clock.
> 
> In practice, Linux would pick a clock named "apb_pclk" for the bus
> clock, and the Linux and U-Boot SP805 driver would use the first clock
> to derive the actual watchdog counter frequency.
> 
> Since currently both are the very same clock, we can just double the
> clock reference, and add the correct clock-names, to match the binding.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

Applied to qspi-fixes, thanks!
--
Florian
