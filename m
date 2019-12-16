Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D00C012100D
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Dec 2019 17:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbfLPQtA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 16 Dec 2019 11:49:00 -0500
Received: from mail-pg1-f173.google.com ([209.85.215.173]:38933 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbfLPQtA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 16 Dec 2019 11:49:00 -0500
Received: by mail-pg1-f173.google.com with SMTP id b137so4032579pga.6
        for <linux-watchdog@vger.kernel.org>; Mon, 16 Dec 2019 08:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:from:cc:user-agent:date;
        bh=g0u6MYVXB1r8q7tLRy3ssmuddCpp1ygE+qNfEAR+tzs=;
        b=GkO3p/N3v9DaMjY7s3JJKqo9ZYMrAiq7NezoyL1jtHl6rflpR5LpxodzDPOS8dZeg5
         QtHOw6SaEFGm0JM8ZeTFp+c9CyZE3latVdmMaNlabZHZwEDIGKnqD4/f4WVZ92UEe6V0
         JLkYF7c7oqGbJsZ4js+mM2KbizqOYu/UwJGSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:from:cc
         :user-agent:date;
        bh=g0u6MYVXB1r8q7tLRy3ssmuddCpp1ygE+qNfEAR+tzs=;
        b=cJYwpk6bW1wgJUForsN5l5wFCuN7MmkZS5S4RSNz4qRzEUUgyROqUIO2dmg9xnx26d
         oPRq2fVAXRrQXY++vLrpj7+mS4ticRyeqekho2UjdtDeJCOC2bcsagbXp4yI6JSKfOjJ
         /GTr/kAekY5wi/x1NqVtT6VdmDayksD4zFT/ixzcnoO4SRECJxOvpJpUKAgw4B/qZmYU
         d7Ou9OnaBU+F5v0lsnOOjao48zcWOXs3EGfV3/a7uAWRJkHtIASe7OrNExru7oVAz3UP
         AWBoHJSUAIS+gFDYsYbY+r9tL6IRASJ+7KmHPDObu0n0oNrpL3hHiAbLRBwlIVFe1SSB
         Cfyw==
X-Gm-Message-State: APjAAAUyo5+Qu7KRhLogMLJxlxPI6oJMqyVYj2hjugdy2A1jmlziIuMH
        s8NG74xBL2VhF7FbBmk9xgSIVg==
X-Google-Smtp-Source: APXvYqxCcxTpMnkRTvpz5cLBjNYbPUx15IUg+xR6p8uH9udpwIzZK5vvkm1iTdzAgUHQrgxw+yGwzQ==
X-Received: by 2002:a65:66d7:: with SMTP id c23mr19824054pgw.40.1576514939270;
        Mon, 16 Dec 2019 08:48:59 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d24sm23769672pfq.75.2019.12.16.08.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 08:48:57 -0800 (PST)
Message-ID: <5df7b579.1c69fb81.c9187.3f3a@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191213064934.4112-1-saiprakash.ranjan@codeaurora.org>
References: <20191213064934.4112-1-saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH] watchdog: qcom: Use platform_get_irq_optional() for bark irq
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-watchdog@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 16 Dec 2019 08:48:56 -0800
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-12-12 22:49:34)
> platform_get_irq() prints an error message when the interrupt
> is not available. So on platforms where bark interrupt is
> not specified, following error message is observed on SDM845.
>=20
> [    2.975888] qcom_wdt 17980000.watchdog: IRQ index 0 not found
>=20
> This is also seen on SC7180, SM8150 SoCs as well.
> Fix this by using platform_get_irq_optional() instead.
>=20
> Fixes: 36375491a4395654 ("watchdog: qcom: support pre-timeout when the ba=
rk irq is available")
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

