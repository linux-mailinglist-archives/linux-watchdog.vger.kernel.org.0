Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5301EC390
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Jun 2020 22:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgFBUQO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 2 Jun 2020 16:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728162AbgFBUQO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 2 Jun 2020 16:16:14 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181B5C08C5C3
        for <linux-watchdog@vger.kernel.org>; Tue,  2 Jun 2020 13:16:14 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id a68so29224vsd.8
        for <linux-watchdog@vger.kernel.org>; Tue, 02 Jun 2020 13:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=KhsfJG4oCqsoI9GIRhKRpIjrp+9Zk74mdmmp8aCuq2a1hgIQ/UEuenme9wTW2SXfXm
         1/XPNUzOuTTbgBxplftFl0LAjy45v8lJBqTnN2qMlWRC6O+QVF3q+VGOlS6VSxtm8DBB
         qv8HQFKA8f/Dkn6T68mdKjvpc314PmcVLN85M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=GokCRbrZMDzIWzKf47n7wC5ygfZAmODsga72JvgsDxr6Hzih27iNbzyw21gfyS7SDf
         JGE8auQAqp+CPTU5xzhm9tCslS0JBNa5h3RJ9GiljRArNKc6jxx+jq6Pon8Ji3Thb8+8
         BuE13doXI9v5N7kOvAPZDfzuButv9fB2uQ9Y9zsiTNXGMkUdS00R2DqeAYBEbKD1eJX9
         nUJIV38V5BBBUP9sKD35hNI6VGT43CU6/3dAcZvLLCwiJ0EqQHs9gcU1rYfLhjnbpSIu
         N7cSISLB+CFJhkpYyBKCT20cbfkyRXDUUMM8sXTUfmf5TGLIPAk98jttQJ324qhZvDSk
         Cggw==
X-Gm-Message-State: AOAM532yqvr2Gci3X7pAD8EzMtaJBSTBDpWupja85IdgW5kCM2lv8/7c
        XQSY7JQU5dE06cbIEnh17DwzRTF2CZshFXu8pAOxBw==
X-Google-Smtp-Source: ABdhPJwWxSm48xu2IYedE3HjBxqBh3jhrLAkDus9F6Z+pbc6ymhCS+e1o72yry/mjVZJVupAG6T+jS2ABjv5v1psG+w=
X-Received: by 2002:a67:22c1:: with SMTP id i184mr6737005vsi.119.1591128972715;
 Tue, 02 Jun 2020 13:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200602052104.7795-1-lukas.bulwahn@gmail.com> <828311d2-61ea-42cb-1449-a53f3772543d@roeck-us.net>
In-Reply-To: <828311d2-61ea-42cb-1449-a53f3772543d@roeck-us.net>
From:   Julius Werner <jwerner@chromium.org>
Date:   Tue, 2 Jun 2020 13:16:01 -0700
Message-ID: <CAODwPW_oxDxF_5-icRs0eaRVLgtP+bDc_OSKa=EcfeSp=c6Fag@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entry in ARM SMC WATCHDOG DRIVER
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Julius Werner <jwerner@chromium.org>,
        Evan Benn <evanbenn@chromium.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Reviewed-by: Julius Werner <jwerner@chromium.org>
