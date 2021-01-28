Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B43306A73
	for <lists+linux-watchdog@lfdr.de>; Thu, 28 Jan 2021 02:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbhA1BfU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 Jan 2021 20:35:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbhA1Bez (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 Jan 2021 20:34:55 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E14EC06174A
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Jan 2021 17:33:59 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id j2so1558110pgl.0
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Jan 2021 17:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=csr+vubEtxZXL8yZ0qw0LhP81IqAfO9jQ1ONZwxJeAw=;
        b=kxykKAiVQ76RxKm+5xK0wGATcsMAaZODjbMyP5IvjmsOTcs6Qy6u63ewC5O1whqxZV
         aUIG0M30udM7TeDnuzIYYj0byAwzGjaBiUcHwTlKcqPhNoP90I2osjFPFHggbagQG8cQ
         cXtID4WOooFP4u2IGsbiwaEUW2EQNOSXjlTfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=csr+vubEtxZXL8yZ0qw0LhP81IqAfO9jQ1ONZwxJeAw=;
        b=jEAXFH4KNSwLMG4P2bubMPuNFqJw3dUZIZfmJyTUhehCcRPw4+rIaOKTlKV8zascpv
         GtJN4l1vs5/GsGcpqGcokBQjErWuUUogQZx/NspXAb7nXKQZtDbtUYhiVd0HwexbBWI1
         oAO97bQ1TFqWg3WFpkE8q4YMby70TWMCT23Wn8qnnrewr0KJBroDig9cJtzyQkeftcO6
         40MrYZynCtknUux3aIWxZNM/7ZzAqa3x/IzXCHCslNUbR4pxy+Zsl96nayfZE0TnJA5L
         kaxVTXjqk0aC4YTDZWFQW6wlElthqadbYfKMqQ9AEtRVEfQlk8jLqfvx6n4EUE7IEdla
         N9dQ==
X-Gm-Message-State: AOAM532Sa0/dzl1Vz+08WnN66XSi9i/i4v/kqs8E7KmV6krN/vlt5jw1
        VPJUs/zllwVTpwGlnyzigwHL1gr4vOmRrw==
X-Google-Smtp-Source: ABdhPJy8yjNZJLeagHf8FZWyZhguvfYXVGj36VnR+uX+d1l8/ax2fWk04OBCFHHy0aTN+3BSmKpVew==
X-Received: by 2002:a05:6a00:86:b029:1c1:99a1:fe2b with SMTP id c6-20020a056a000086b02901c199a1fe2bmr13885025pfj.29.1611797639088;
        Wed, 27 Jan 2021 17:33:59 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:304c:5453:303a:8268])
        by smtp.gmail.com with ESMTPSA id r5sm3487125pfl.165.2021.01.27.17.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 17:33:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126150241.10009-1-saiprakash.ranjan@codeaurora.org>
References: <20210126150241.10009-1-saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH] watchdog: qcom: Remove incorrect usage of QCOM_WDT_ENABLE_IRQ
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        stable@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        jorge@foundries.io, linux-watchdog@vger.kernel.org
Date:   Wed, 27 Jan 2021 17:33:56 -0800
Message-ID: <161179763694.76967.7406861246436700530@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Quoting Sai Prakash Ranjan (2021-01-26 07:02:41)
> As per register documentation, QCOM_WDT_ENABLE_IRQ which is BIT(1)
> of watchdog control register is wakeup interrupt enable bit and
> not related to bark interrupt at all, BIT(0) is used for that.
> So remove incorrect usage of this bit when supporting bark irq for
> pre-timeout notification. Currently with this bit set and bark
> interrupt specified, pre-timeout notification and/or watchdog
> reset/bite does not occur.

It looks like the QCOM_WDT_ENABLE_IRQ bit is to catch a problem where a
pending irq is unmasked but the watchdog irq isn't handled in time? So
some sort of irq storm?

>=20
> Fixes: 36375491a439 ("watchdog: qcom: support pre-timeout when the bark i=
rq is available")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
