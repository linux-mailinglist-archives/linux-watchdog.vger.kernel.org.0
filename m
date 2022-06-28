Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1A8B55EF48
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Jun 2022 22:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbiF1UXW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Jun 2022 16:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232422AbiF1UVu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Jun 2022 16:21:50 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D803D4A4
        for <linux-watchdog@vger.kernel.org>; Tue, 28 Jun 2022 13:19:40 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id u9so18688267oiv.12
        for <linux-watchdog@vger.kernel.org>; Tue, 28 Jun 2022 13:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wQxdhK9VH2mOR/RqG890s8rdLEEOBchE5Ucgc50/nQo=;
        b=a7D+OyQg3StX1iZZqgH24rDcNqnYEe5+rgiZdr7FJTrpK6RzDxq8QxRc/pMwhWXZZO
         6vfIDKonQqkkslejc1RSH9/UmPq0obcTv5fF7lCfga56KC8AOPsCYV69iIMKXX7Qn+sG
         hJWQXDRvVzWpKwIkwPIgUEnaqjWpavLItDL8KKQeAlMNuDT+4JNvL7pDMCrJI7C0Hk4g
         FhYgYVaebKaFnGux7+viaF2sHEnGAA3dzy8HICmcfxoeXPVhqtjbaUKJlL8bw/LXleJm
         HIIKm3gqgpg+IBorrZtS5mEiScdfuGqoqo3AYbjFfGTcdyhV4hI8QrnodVpcMvrrpMuJ
         tOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wQxdhK9VH2mOR/RqG890s8rdLEEOBchE5Ucgc50/nQo=;
        b=ftTpNZYZWGKIlXj8104wuDhEHpKL6fSCe/yRPU52Sz0XNvvJF6TEghzL/Io2q6LHTn
         wsWoPH4E1tGeX1YIYe7IvBRPgPmFdAhQMY9ALPgfUCA4xIlcQGWMGoSNgCUg4m8VojTe
         41VWVdMbc86+cujyRTsLSFsf6RagY2Bft7kYF0u0FHE21PvvT99bp5X2VbJ/qIJ6bi8B
         y0BNzzuJK7BD/sJb050V9RR+QdC6miqbkPcbWg01DEsY0EF+OQSyfPlq7DYQwkyT3QmN
         r2yfccwZi2f3F12g+/SNHwxeq0wcpECZ1LCJoSr9AnqpmdhI23SKeQFQilqcPjMokWk7
         BbBA==
X-Gm-Message-State: AJIora/vqeCapBrUmMxP7IBPMhC7L82uTTKe4Z/bWPh7KC1t1C/xEOfS
        5hh5EK2iwzuFNTlmpBz5+tAOOQ==
X-Google-Smtp-Source: AGRyM1uzOEv58aSoDC+68Uf8ok5EzQnSOVDGh8ZmTW18VNCNE+wvI04spUVfacSMXF2VjSQl7m8TLg==
X-Received: by 2002:a05:6808:1a03:b0:330:5a56:46de with SMTP id bk3-20020a0568081a0300b003305a5646demr935988oib.76.1656447580264;
        Tue, 28 Jun 2022 13:19:40 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a12-20020a056870d60c00b000f30837129esm9536923oaq.55.2022.06.28.13.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:19:39 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     wim@linux-watchdog.org, Rohit Agarwal <quic_rohiagar@quicinc.com>,
        robh+dt@kernel.org, linux@roeck-us.net,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        manivannan.sadhasivam@linaro.org
Subject: Re: (subset) [PATCH 00/11] Devicetree Changes SDX65
Date:   Tue, 28 Jun 2022 15:19:08 -0500
Message-Id: <165644753307.10525.7692596581954064633.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1654080312-5408-1-git-send-email-quic_rohiagar@quicinc.com>
References: <1654080312-5408-1-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 1 Jun 2022 16:15:01 +0530, Rohit Agarwal wrote:
> This series adds cpufreq, watchdog dt nodes and enables
> remoteproc in sdx65 mtp.
> 
> Thanks,
> Rohit.
> 
> Rohit Agarwal (11):
>   ARM: dts: qcom: sdx65: Add CPUFreq support
>   ARM: dts: qcom: sdx65: Add modem SMP2P node
>   ARM: dts: qcom: sdx65: Add IMEM and PIL info region
>   dt-bindings: firmware: scm: Add compatible for SDX65
>   ARM: dts: qcom: sdx65: Add SCM node
>   ARM: dts: qcom: sdx65: Add Modem remoteproc node
>   ARM: dts: qcom: sdx65-mtp: Enable modem
>   ARM: dts: qcom: sdx65-mtp: Increase the vmalloc size
>   dt-bindings: watchdog: Add binding for Qcom SDX65
>   ARM: dts: qcom: sdx65: Add Watchdog support
>   ARM: dts: qcom: sdx65: Add pshold support
> 
> [...]

Applied, thanks!

[01/11] ARM: dts: qcom: sdx65: Add CPUFreq support
        commit: b427679adcddf9d56b28175d435fc7ec4d4c99ef
[02/11] ARM: dts: qcom: sdx65: Add modem SMP2P node
        commit: 7f928c735880ed20e4d7670416aa7877b47a47d1
[03/11] ARM: dts: qcom: sdx65: Add IMEM and PIL info region
        commit: 69117a2abfe0b02c6828979e8a6f9b039908b42a
[05/11] ARM: dts: qcom: sdx65: Add SCM node
        commit: 261e09b4e3fb847b9a1e99538e31fdfdc2d1ee90
[06/11] ARM: dts: qcom: sdx65: Add Modem remoteproc node
        commit: a3ae01ed96e7efc2525125c36dc8e34186f0d7bc
[07/11] ARM: dts: qcom: sdx65-mtp: Enable modem
        commit: aae0f5314f95df66962acfcce23158e2a047b03c
[11/11] ARM: dts: qcom: sdx65: Add pshold support
        commit: df6d7b86f4885d370886a44339017e32c80556e7

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
