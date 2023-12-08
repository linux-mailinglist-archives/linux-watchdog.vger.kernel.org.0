Return-Path: <linux-watchdog+bounces-170-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D5080A782
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Dec 2023 16:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D23C1F213EF
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Dec 2023 15:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A8B31A71;
	Fri,  8 Dec 2023 15:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SupUWkl5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCD210F1
	for <linux-watchdog@vger.kernel.org>; Fri,  8 Dec 2023 07:34:49 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-332c46d5988so2341645f8f.1
        for <linux-watchdog@vger.kernel.org>; Fri, 08 Dec 2023 07:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702049686; x=1702654486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0smOkN0JwIYP/mQNjuHR8QDcn+P+VGLbn6lLRSQdlCM=;
        b=SupUWkl5+WKbC539iz9TsBtvH252/eXg66O3Uat5KPQCBYxcg0ihnzN2/vFqnwr/Ly
         4R6K1Y9lSwvdqhZ9rWibENFsrzdO9gl4wQ2yCMZNdHHrSuhyotjeWCNiJXCfuuUiK65R
         4gH6+MtHSDy4GjvXW3Iee2OpD7Ln348lPnkhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702049686; x=1702654486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0smOkN0JwIYP/mQNjuHR8QDcn+P+VGLbn6lLRSQdlCM=;
        b=Pb96RecAInUs2eFDYLVqRHP8dhHM6NTgmjnPfPWsLZC82uSHc7wXLs2CuVSSLQrl8l
         +iyn/Pnrc+YjyDYFSGifTRxgKzD5/RZ8LPqvqu6A5gWtTPtB8uAJ3bnFVo3ZZbl7ew81
         OoF/cm2CzfZOdW/kyp4ToXOfyC840ZrY2cmRN7/OeQ1Yu8EqDLnbJ2sM7eQ29rj/wZnR
         44600ThlxZJiBmBI3Tii7qkzHBm72wJLln5856qMZ+aBVCs5G2PVTu54Qk86E7PmFp0z
         9Z38dr2QLf8KtzSnwv6s2JCwrzpS5yZXd+Cz5u+p9yl2Is2OjWC9VOQ5pYAa9nozUyJV
         LPTA==
X-Gm-Message-State: AOJu0Yy2WM72+Ft7gwIOlajPHnccr84tsA1qnsIJeW3ozJXkglNUJaKW
	3QE5DmkxXz+XldqI2Mx0ix28A5gkY8/qdlz71eElbA==
X-Google-Smtp-Source: AGHT+IEbZ3IhfVV2cUYwreRXvChalglQWE/NZdgoLiIm9Kpvb/W3+IeQcRhPdiOw+U0PSW1TQBIA2g==
X-Received: by 2002:adf:e54a:0:b0:333:3d0a:504f with SMTP id z10-20020adfe54a000000b003333d0a504fmr147454wrm.25.1702049686448;
        Fri, 08 Dec 2023 07:34:46 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id fj17-20020a1709069c9100b00a1e4cae6b22sm1129512ejc.41.2023.12.08.07.34.45
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 07:34:45 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c3963f9fcso3685e9.1
        for <linux-watchdog@vger.kernel.org>; Fri, 08 Dec 2023 07:34:45 -0800 (PST)
X-Received: by 2002:a05:600c:b92:b0:40c:2399:d861 with SMTP id
 fl18-20020a05600c0b9200b0040c2399d861mr61604wmb.6.1702049685373; Fri, 08 Dec
 2023 07:34:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106144335.v2.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
 <20231106144335.v2.9.Ie30c1d3f780666f6906fd2fd7c437632c229d987@changeid>
In-Reply-To: <20231106144335.v2.9.Ie30c1d3f780666f6906fd2fd7c437632c229d987@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 8 Dec 2023 07:34:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XsPGvNggpJPCpF=xhkm3dOHsStycZvuVttA=ZH6=EUmw@mail.gmail.com>
Message-ID: <CAD=FV=XsPGvNggpJPCpF=xhkm3dOHsStycZvuVttA=ZH6=EUmw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] dt-bindings: watchdog: qcom-wdt: Make the
 interrupt example edge triggered
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: swboyd@chromium.org, linux-watchdog@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Gross <agross@kernel.org>, 
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 6, 2023 at 2:44=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
> bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
> interrupt should be configured as edge triggered.
>
> Update the example in the bindings.
>
> Fixes: 7c631cdff391 ("dt-bindings: watchdog: qcom-wdt: allow interrupts")
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I saw Bjorn landed all of the dts patches from this series but it
looks like the bindings patch got left behind. Anyone want to claim it
for their tree, or Ack it saying that you'd prefer for it to go
through someone else's tree? I assume Krzysztof's Ack means he's not
intending for it to go through the DT tree and Bjorn doesn't seem to
intend for it to go through the Qualcomm tree. Guenter/Wim: it feels
like this could go in the watchdog tree?

Thanks!

-Doug

