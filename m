Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E81297E2F3D
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 22:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbjKFVwc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 16:52:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233182AbjKFVwb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 16:52:31 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F2AED7F
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Nov 2023 13:52:28 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c503dbe50dso68536411fa.1
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Nov 2023 13:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699307546; x=1699912346; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcLpYQwHOJBs1+bgx/XyMohSbAkHSHoZFZS+/mc6OhY=;
        b=XtMWDFxT2X2LyBM2vs1jV9nlKOgjtd2jyewQwPe04aYkMuJkygwJaIUzZ1X48YTKV9
         j9VPZbB0Y9REGxL8AJgkjoDbc3AvLy3ZJ1ii8rsRdrUN/cCR8Rg618bh950smNYHsk1S
         jWVSolYCW9eDRjUwsUu8gNZL0aLmCNDsQuobc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699307546; x=1699912346;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcLpYQwHOJBs1+bgx/XyMohSbAkHSHoZFZS+/mc6OhY=;
        b=a5ikDAwYQeueM+Vfa+qQjoYNKvY3vHLaSDYscnoxQCRthJneJNFE9rPC69YPtzJYoD
         jGsZfn2C/1rHR8dc77amEogC0/Q7DTHEoZ/M0+t+bMVf3+nsI490p3UNJ74t3vbd3cWD
         w72HljNr7bRyc5n1En40NHE5muf+kRZ6hLaPdHofypVwY+tCzkK51epOAx8mB1sVuSaQ
         N6aGDBXNGezNphbCzAku52CVlEwlc7Th1V+PHm7IQKsVrHZyTPiRMZf48pk75HF8uz+X
         X3eowMe46U4+AzM+8VpLEeT67nbWWsLW1u2w7v0QhpR9Va2ah+VJQyoaRfohY2VFTwEb
         eU4A==
X-Gm-Message-State: AOJu0Yzy2htyAnpHnBCXvmb9F5DXyNnPSfGEkBvEEtn3k+V2WDBXlAlF
        QUotBT/xQ5+cT5y1HGQVaRutx+a17yqMFqigi1f8gg==
X-Google-Smtp-Source: AGHT+IHwaWHjOprXL57hNf2rFZSX55S5GAUN1q/qHfDTTNIOltSUt0SKeimJVCNC7yGPADzZ4lTXV9ddU9TVuiCpVKE=
X-Received: by 2002:a2e:a98c:0:b0:2c5:4a5:9560 with SMTP id
 x12-20020a2ea98c000000b002c504a59560mr32234027ljq.41.1699307546288; Mon, 06
 Nov 2023 13:52:26 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Nov 2023 13:52:25 -0800
MIME-Version: 1.0
In-Reply-To: <20231103163434.8.Ic1d4402e99c70354d501ccd98105e908a902f671@changeid>
References: <20231103163434.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
 <20231103163434.8.Ic1d4402e99c70354d501ccd98105e908a902f671@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 6 Nov 2023 13:52:25 -0800
Message-ID: <CAE-0n5152eMZ_muL3rBOc6gyRQOXA0U8=vXp6GkkuvOo3Mp+mw@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sm6350: Make watchdog bark
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
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Quoting Douglas Anderson (2023-11-03 16:34:34)
> As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
> bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
> interrupt should be configured as edge triggered. Make the change.
>
> Fixes: 5f82b9cda61e ("arm64: dts: qcom: Add SM6350 device tree")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
