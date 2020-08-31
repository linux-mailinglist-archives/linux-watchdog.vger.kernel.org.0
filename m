Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B158A257288
	for <lists+linux-watchdog@lfdr.de>; Mon, 31 Aug 2020 05:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgHaD5T (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 30 Aug 2020 23:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgHaD5R (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 30 Aug 2020 23:57:17 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5CCC061573;
        Sun, 30 Aug 2020 20:57:17 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id w186so3577704pgb.8;
        Sun, 30 Aug 2020 20:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ykyBZg47k8iiT4JLOn93BEm9mAc3y2MUAdCVFevbj/w=;
        b=XWQu9TuCnd8HLxIdVFnVK+mWyIhkl87+U/+6M7Do+Pn7qqHY5oRAsTXcQpDaHyl6Cu
         l9SkEn1siOuX/3wu8VJVX29392Q+hTPu488YsNpU2v59h3Y81sDH69WTKkbyfboiiyaJ
         IQw97vYWs1XgGZVywt+wc6G0/zN5bImseZ7+aqVz8GAcko3ZxMVa4IjqG9kGp0fwZefe
         CEdAb4SR1K+GElnd2ugQnsfLIsDcIJIN+cDvVHf++DrSN/Du6+yPtVt4iYsxsIFDWCZ7
         75pboZFTHGpFsxj8+FF6rBGUAcUhJcMI6fYEy1vsYQHu7K5D6OnaMhmHeuWFvq0Pkhmd
         wwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ykyBZg47k8iiT4JLOn93BEm9mAc3y2MUAdCVFevbj/w=;
        b=IPXcbFtg323gw+DhD68jOk/tAtqfFvOY/KXEyeR6tY6L/FDWySCL8K0P5KPuQG+Zb4
         bVjfy2kDptgrkuhyq1v1yP9lFWNWyHmdF/8pTLbfMIh6H6k65f7/hsoe3fMQVSFJwP3o
         LhpsjoCIoeXAxy2c/ljDoRSTbayOLSK6X+kVS/tKcP6XCeNgwhftiO29/KI1oBoUm7Ij
         7AvMxWS+Tet/fjAUJbBsh4Q9iwTeNGkBGIgLHCn4k4cwyUs+gMUdtu6gCpdORVpk5iiO
         rFO/tV/PW7GGMLBhpTsX4SRsQQVt4gPngPeenB83BvjIf8Htt18FmTnYHkoGYtqfL1+7
         suRQ==
X-Gm-Message-State: AOAM532qplssuiaqVCVj8X/kpJnR1x0xcj9rLQ+KgTZG4F4WEjngeutK
        19bmCZ3me/JbaNkTcCTwR6Y=
X-Google-Smtp-Source: ABdhPJyJqq6zsGWDfWMT8oFWCgNMz0mJjgLrAJG+5RiZegHr1dMegy5WXhh1glYXIizExP/tj5VTOw==
X-Received: by 2002:a05:6a00:148a:: with SMTP id v10mr7525858pfu.278.1598846236867;
        Sun, 30 Aug 2020 20:57:16 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id f28sm2960953pfq.191.2020.08.30.20.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 20:57:16 -0700 (PDT)
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
Subject: Re: [PATCH 03/10] arm64: dts: broadcom: Fix SP805 clock-names
Date:   Sun, 30 Aug 2020 20:57:08 -0700
Message-Id: <20200831035708.1332428-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200828130602.42203-4-andre.przywara@arm.com>
References: <20200828130602.42203-1-andre.przywara@arm.com> <20200828130602.42203-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 28 Aug 2020 14:05:55 +0100, Andre Przywara <andre.przywara@arm.com> wrote:
> The SP805 binding sets the name for the actual watchdog clock to
> "wdog_clk" (with an underscore).
> 
> Change the name in the DTs for Broadcom platforms to match that. The
> Linux and U-Boot driver use the *first* clock for this purpose anyway,
> so it does not break anything.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

Applied to devicetree-arm64/next, thanks!
--
Florian
