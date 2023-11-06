Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A29B7E2F2B
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 22:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233169AbjKFVue (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 16:50:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233131AbjKFVud (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 16:50:33 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987EA134
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Nov 2023 13:50:30 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c504a5e1deso66217291fa.2
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Nov 2023 13:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699307429; x=1699912229; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Po0baWUeZiXrEfsJEnTtgJ907NjsZipDGSvYn9f7jW8=;
        b=TRtocQ234gWAZq3PTgm4+9O3T5fih1V+NqJhMHFhWAoYu4xGwVwXg1LN0ZECrtKxCF
         a/d5SMN8n4YXYqYNmKQYymm2Bk7d3Ns/najA63Ny8zu1PdZ5i2hUbnNIdONyifyuL5B8
         hSb3PMqZZjMLVkXSOzZKOx8hCejbVqnDYF/00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699307429; x=1699912229;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Po0baWUeZiXrEfsJEnTtgJ907NjsZipDGSvYn9f7jW8=;
        b=p/rTWi3JMrjZdG/FO8U+23EO3sQ4pqzekzVRbnDbul1Elzm2husMMpun4W32i8gqFn
         MGufGz7SL6BHp7h5C6ZjiOC06L3cfNIHkPHMuzq6Y0PTiNEnHWqq32y3uHZM7Xjl0ePe
         gFOAMHHYb6KICSO1E9ZCJAi6bgr6ICBYvE820puhMcdjKiTsRXIbTDW0HB24WUtlO7L7
         8dtTKgCSkf+1menFEcCFMq8ompnELiHTs8U+dJzr4zq1vTnCHkPXSA9KPgNWfNKdVEUr
         z73+i+R5D385/9ZyQpNgMLgJ6fuqwi/Wy0YOVCc9wWPqO4khznn8DiZvtjs73Y88ugQj
         hG2A==
X-Gm-Message-State: AOJu0YwpQp2LHsh47zeFgy+7g8q23xG90RNQNdDF7lKvX7qYPZ8RPleS
        ivoZaiD4d1SUEL/t9eJIGnY/5CmAvMmkkznjirQEFQ==
X-Google-Smtp-Source: AGHT+IFIMysEALHhZCYIuAeRzHTWg4/eThhbNgVFU1BxyT+5HSLRRz+uRWCoRmFfu6lwHDY82ry+or3PNN915oiLWc8=
X-Received: by 2002:a05:651c:1208:b0:2c5:1a40:f26a with SMTP id
 i8-20020a05651c120800b002c51a40f26amr23481179lja.13.1699307428851; Mon, 06
 Nov 2023 13:50:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Nov 2023 13:50:28 -0800
MIME-Version: 1.0
In-Reply-To: <20231103163434.4.I23d0aa6c8f1fec5c26ad9b3c610df6f4c5392850@changeid>
References: <20231103163434.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
 <20231103163434.4.I23d0aa6c8f1fec5c26ad9b3c610df6f4c5392850@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 6 Nov 2023 13:50:28 -0800
Message-ID: <CAE-0n51twrV24BE9aBNA8rA4y4J-Dpfh2ZnNMXdZEth-HGvbqA@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm64: dts: qcom: sm8150: Make watchdog bark
 interrupt edge triggered
To:     Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andy Gross <agross@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Quoting Douglas Anderson (2023-11-03 16:34:30)
> As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
> bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
> interrupt should be configured as edge triggered. Make the change.
>
> Fixes: b094c8f8dd2a ("arm64: dts: qcom: sm8150: Add watchdog bark interrupt")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
