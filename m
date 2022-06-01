Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0FE53AD73
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Jun 2022 21:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiFATbK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Jun 2022 15:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiFATbJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Jun 2022 15:31:09 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A40A5243ED1
        for <linux-watchdog@vger.kernel.org>; Wed,  1 Jun 2022 12:28:43 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-edeb6c3642so4042036fac.3
        for <linux-watchdog@vger.kernel.org>; Wed, 01 Jun 2022 12:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=DxxMd4k8tG1Z+DI+JxuL9225Cp+S+uInl/poXMcuMZiTQV1c8XJNPCuJB0EN9Fm1lJ
         tjqO15tZbiRtkiZc869kqZb+gTGwGsofr4Ks/EzA24HoqZkeukApCRLbeWaJgYbzN6Uj
         DJcyUaN0vgzLiaJiK8SKJwd17XWuJUN7X4OrSO+zy2q+txFdEpb8ifoCAb/ECnGeqxQV
         22+OgKU21rrXICCeKXN25GVJHEIOuX810V30PW3f8Y111fShlwSlQkBARV9N87g0aoLJ
         wQNCoaF08Ng768jLDvSBCHYHS21HkQkWfLc+tM30B/O2SgLendb0dLrFE3BY6UlGqUm0
         gBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=A/tBAPljUQv6SMdw1Ju7g+bFmZSjP7zWlgGvt+Uvx2ZusRsptWCBigAaOzqNSvLIlG
         jQXBBgED2lHmt1DZtRicDiuiiJqgethRgMUdO6+ajaMAteyNNG4Aj1jgJpniLwhXRkXa
         yQelW1+Y7+nQ761/h6tX0jsqNAiPR4+Jvyus6Py15Bw9sBu8GkX/ULbbOeW4+qarZ0yN
         sTDQMd40q6ocRB2Kw9h1OEZgELjCZagCKm7klS7fawlSMmrwbxMxIPrDRAfDhsXDwWOv
         6PK3GvbFu7jfQYtEg/AAr/SGl+r4XJgMBclu9b5y1V1EUyJhCyeHlgKq6emb0pWRsrzm
         IpJg==
X-Gm-Message-State: AOAM530+hRmC56WGfc/2N3QORpwpUIHmWN3Q9Bd9sWt9O53DdeyNe53j
        OOd4rivfPmX1lNSwErIayxmf19BNdsGXRbyzEg3RNVjoBpw=
X-Google-Smtp-Source: ABdhPJxRHJ7PowqzwP8FVf7Pao2siL9+mp8F+vsKwg9Hvlld1uXwEH8+vzJyu5zLQk9d57eu+g6BtXkHW1P4ce0P3TA=
X-Received: by 2002:a05:6870:4619:b0:f1:e78d:fd54 with SMTP id
 z25-20020a056870461900b000f1e78dfd54mr18175523oao.195.1654111088174; Wed, 01
 Jun 2022 12:18:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:3601:b0:a3:2139:251d with HTTP; Wed, 1 Jun 2022
 12:18:07 -0700 (PDT)
Reply-To: johnwinery@online.ee
In-Reply-To: <CAFqHCSSUC0MpbjYK8d-GCxOG4b6Qbk2uH3+xQDZte6cPBsxLGA@mail.gmail.com>
References: <CAFqHCSSUC0MpbjYK8d-GCxOG4b6Qbk2uH3+xQDZte6cPBsxLGA@mail.gmail.com>
From:   johnwinery <alicejohnson8974@gmail.com>
Date:   Wed, 1 Jun 2022 12:18:07 -0700
Message-ID: <CAFqHCSTLW5uHwBqcyU-qn7_jF2jtwt2-CjgdN8-B9nAn9yi+vg@mail.gmail.com>
Subject: Re:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Greeting ,I had written an earlier mail to you but without response
