Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3681F20FDD7
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jun 2020 22:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729838AbgF3UjF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jun 2020 16:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729341AbgF3UjE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jun 2020 16:39:04 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3324EC061755;
        Tue, 30 Jun 2020 13:39:04 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id m22so108173pgv.9;
        Tue, 30 Jun 2020 13:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SQiFOaLh1j0WoaGW8HU6ASOHGGkIHwej9YhMbLkGD8g=;
        b=g+V9UwcbjoJZzicB/JpaUeCKluYowoLvLMVisPV+jeRGBTkI7Nz6RPIzsGk12F0fH4
         zq/A8QQj7ER1s5L2bebyDMf6pcf4jJrFqPWsz8Nf6m0g+E9DkiBSX/L5ca6pNqUeCCcw
         iu1N4qUwaKLe25xgQCJ55rIiIZhS9Jk/Mn1DheWX9BumrVflAOe0cqTGIDEAl2iLhDDq
         yEsH105D84RpOGz42JNSKMcQ/fBYJZ6v5H+5+9SpjyGb2U435gTzdIYaTB+IqQSAkHYy
         PWalaZd40GHE5Q60lwbIZU0JyTULWHVU9DbPFz8cUzJJVBeh160NzRcC6d1Gu+WZR29m
         CsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=SQiFOaLh1j0WoaGW8HU6ASOHGGkIHwej9YhMbLkGD8g=;
        b=AVc6+mbv1r3LFj1+3t44r3k1NaSmP/mmOsAvBgGX0a0vjFT6umw1/ngR+nX6ijsS1w
         8JwX8bTQu3f8ThrswynZ/ChSYZJuA8L1JML/vtZceHReBzWiEW/q/OaDh9ZIT2mGYfPF
         OUdISTxrQ4R6ck45snD9N5Nzr8mM0DE4uqI0RJGt2o1yrRCI9K8QJYaEnqpuX2CW78h/
         HYtq1cvHO+3W9OiYw9Y76ibIlVWADRFOtVH1m6n4UfH2jkrOi4AGmhbAC2Jla7Ey89un
         aTeisQYtBK+pAUwuI9zamx+j32bH+4NFla9WJmuwb6zg1uFeLTuTTY+2325+wvInSiKR
         bnBQ==
X-Gm-Message-State: AOAM533CfYMJp7cQkfiYwZ9n3e/JWc9azHsTY1/evGys1l63C4bTtTTh
        iwF+by4GLZwTggUD7k2WUnk=
X-Google-Smtp-Source: ABdhPJwBbu9XaH6Gaawzg4apz35khgge11T7VS3A9pjCwqj0I3uOdYn6Igtq9M7Fe91d4sXCDCowiw==
X-Received: by 2002:a05:6a00:1507:: with SMTP id q7mr19535233pfu.131.1593549543796;
        Tue, 30 Jun 2020 13:39:03 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 19sm3576756pfy.193.2020.06.30.13.39.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 13:39:03 -0700 (PDT)
Date:   Tue, 30 Jun 2020 13:39:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCHv3 2/2] dt-bindings: watchdog: Add compatible for
 QCS404, SC7180, SDM845, SM8150
Message-ID: <20200630203902.GA20540@roeck-us.net>
References: <cover.1593112534.git.saiprakash.ranjan@codeaurora.org>
 <09da1ba319dc4a27ef4e4e177e67e68f1cb4f35b.1593112534.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09da1ba319dc4a27ef4e4e177e67e68f1cb4f35b.1593112534.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 26, 2020 at 12:59:05AM +0530, Sai Prakash Ranjan wrote:
> Add missing compatible for watchdog timer on QCS404,
> SC7180, SDM845 and SM8150 SoCs.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 5448cc537a03..0709ddf0b6a5 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -15,6 +15,10 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - qcom,apss-wdt-qcs404
> +      - qcom,apss-wdt-sc7180
> +      - qcom,apss-wdt-sdm845
> +      - qcom,apss-wdt-sm8150
>        - qcom,kpss-timer
>        - qcom,kpss-wdt
>        - qcom,kpss-wdt-apq8064
