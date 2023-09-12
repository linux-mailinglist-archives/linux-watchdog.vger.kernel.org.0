Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA2D179BE7C
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Sep 2023 02:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235244AbjIKV4Y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 11 Sep 2023 17:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235933AbjIKJqj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 11 Sep 2023 05:46:39 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC2DE50
        for <linux-watchdog@vger.kernel.org>; Mon, 11 Sep 2023 02:46:34 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31adc5c899fso4459953f8f.2
        for <linux-watchdog@vger.kernel.org>; Mon, 11 Sep 2023 02:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694425593; x=1695030393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpfWGrPSBuBG7+U0dwFU/lJOZNNMxd815XPw6Rgs8Vs=;
        b=T3SL7uV5AdPFFeLBv1F2qq1NgAEXjkNRT4PFB+zScyqt0fZvOv7XSflZI9AnLomHVs
         jZulrZ3Lnj3CMR2xVzCdezXaUJ4sPGo/fZxEV5oU67GZV77vOPdwuscq41oj7rEHxlZR
         4bweWT3qB7v1ROEK6+by62Vo1U0COpzbXR0RLSf+lks7SotLB7Pic2abQcU4rooHj3Q9
         tdBA/FDKWkhCCvX7Jdxhw5DoE5lBCMKQYBL96YRl+5HZY4f62+Td7iDxlEtojJaCWtv6
         tJ0s5Uf2VjNbGvsPfJS2weOtNGaqtajx69kexBc0iYk/rjLhvr3bxi1VJ7TWsNe04Jky
         nPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425593; x=1695030393;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpfWGrPSBuBG7+U0dwFU/lJOZNNMxd815XPw6Rgs8Vs=;
        b=P42PoAJnQrpEORIh7sitKMXrUWwUXzTToxfEcoz6nA4tWYYhbhbPfmOM/l4S2cmdPh
         /VUVDgruXTofeU0fTqxHUpqowTMwV5kRND5Zn7hUwD1z/wHbHXyYL5HdyJMnOvRagnaH
         DJdt7CzGRauDSeocpWlz+mm79dIxylI9tLk1k7x/Ef27+JjkK0kIJK5wzZ+kQ/Y1EtZ4
         4zsxASObg0AWU/mahDEeYujaIpFEDK0a0Pz66EQ/kDL0s/w0TnUosgh6uIv5W/xGu/oA
         YGtk9Pv+gCM6huEc1YTPyBnJuHlfDTFcWzDLnNmD5H2sPq+bOg71mKPtX3s0Wtvue1Ou
         utBA==
X-Gm-Message-State: AOJu0YyW9VzGTM4vY0gVvZeDeXAW9spdz3T67klXTOjzDNjbGq09co3R
        bCodcJdTEN6QGo4eHaeeLhU3kA==
X-Google-Smtp-Source: AGHT+IFB2NUgPRCR1E53L1RZWLMIv4pvvpcenAmQmhAg3oTkQvuSqfR80muGqdBVaRCoXOqcPSinSw==
X-Received: by 2002:adf:b345:0:b0:31f:9838:dfc4 with SMTP id k5-20020adfb345000000b0031f9838dfc4mr3521960wrd.33.1694425592923;
        Mon, 11 Sep 2023 02:46:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d13-20020adff84d000000b00317909f9985sm9503496wrq.113.2023.09.11.02.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 02:46:32 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com,
        Huqiang Qin <huqiang.qin@amlogic.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230802033222.4024946-1-huqiang.qin@amlogic.com>
References: <20230802033222.4024946-1-huqiang.qin@amlogic.com>
Subject: Re: (subset) [PATCH V2 0/4] Add watchdog support for Amlogic-T7
 SoCs
Message-Id: <169442559190.3235506.16709679651395559880.b4-ty@linaro.org>
Date:   Mon, 11 Sep 2023 11:46:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On Wed, 02 Aug 2023 11:32:18 +0800, Huqiang Qin wrote:
> Based on the original Amlogic-GXBB watchdog driver, support
> for Amlogic-T7 watchdog is added.
> 
> [PATCH 1/4]:
>   V1 -> V2: Unchanged.
> 
> [PATCH 2/4]:
>   V1 -> V2: Rename rst_shift to rst and use the BIT() macro
>             to build its initial value.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[4/4] arm64: dts: Add watchdog node for Amlogic-T7 SoCs
      https://git.kernel.org/amlogic/c/8a63d22183d0d96d742e34730430cc1f286c7092

These changes has been applied on the intermediate git tree [1].

The v6.7/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

