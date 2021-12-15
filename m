Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6934765BA
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Dec 2021 23:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbhLOW2K (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Dec 2021 17:28:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbhLOW1z (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Dec 2021 17:27:55 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C965C06175A
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Dec 2021 14:27:55 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id m6so33737121oim.2
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Dec 2021 14:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0k/4WghU8oFurHJHEHSouu6Us6eVLuVOzOhdp+JcH0k=;
        b=NeDhHnDzQKmHQdukLfPb57fcY9sRvEeshRGWjl6VbHYN/VNd2WIdiGucN3VyQHfHyi
         ODX0tPBTzdHUhS/K/UFskuk3zbVPplOGuu1x/3hM6Od2OgzHrir6KktuGRDLF4LOX+Vz
         smHiXw5l4g/gYIGX3S+KGZWonIZx7TDqmoQI+DekZRsEy3SrNmlSXlyCCG5uZAu0Yfzf
         LJrhT5CgejLIjStw/okC2VQgzpIsD4mkhq6Jnn8j/tcQRpqfLEkVXuhlhZMr5QdglWyz
         S7wASV77km5m+lI0oQ4m2DMor4fr4TyP/uoOVeJECDFrpy5pBzEl3XpiE4O2sXMtjjSt
         YvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0k/4WghU8oFurHJHEHSouu6Us6eVLuVOzOhdp+JcH0k=;
        b=TKLbNOq6fTCDsqc8+m0vZLWKgEUc5acINmFsTAwxUBl4lI73ESDl/3O0PbBbO/gRB7
         kabmrlpiRN0x6ei8sgtoo8R+Ml5hngDOv5+/O6jKKkZeCUHAoAROALDZAfy+b5peEU5y
         T0qLXOc1OnSwremLe5jX99xHP06hEgr7QWRh0qMajU3EacSu4sZH63qDP0oo0eR0nHB/
         zu8/1ai+Gty35X7zjpHQMjq/n4HhUYiKUmeYCkH6e15idWDF/C2OqRM1C45YLEvLYWwG
         wniW0b5ax+nMAd8Zx42g7cIrbgNe/EmrdWaAiIPGlabQy/mO5PW5RYVw59g5ju0I3Uzy
         y20g==
X-Gm-Message-State: AOAM532M2EkzOKNKp0N1EUjEsfWl4vLQ1JAprPy7UQ6bvr4D+/QndSZi
        SMIPfE4RkHwy6gzjrPLrTyzoWw==
X-Google-Smtp-Source: ABdhPJyiZGSg7nl3iPZNacNkzzIriIsA8K+pbTW1R7BSm60R5ayfzMXsdIZwV+OW92zh2rfswPUntA==
X-Received: by 2002:aca:1202:: with SMTP id 2mr1806801ois.63.1639607274378;
        Wed, 15 Dec 2021 14:27:54 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:27:53 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        de Goede <hdegoede@redhat.com>, linux-phy@lists.infradead.org,
        linux-fbdev@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Amit Kucheria <amitk@kernel.org>, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: (subset) [PATCH 00/10] dt-binding patches for sm6350
Date:   Wed, 15 Dec 2021 16:27:26 -0600
Message-Id: <163960723734.3062250.16152122166909189415.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211213082614.22651-1-luca.weiss@fairphone.com>
References: <20211213082614.22651-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 13 Dec 2021 09:26:01 +0100, Luca Weiss wrote:
> This series adds compatibles to the dt-bindings documentation where it
> was missed before.
> 
> Finally, the last patch solves some further dtbs_check errors by
> modifying the sm6350.dtsi to match the binding docs more closely.
> 
> Please note, that the first patch from Konrad is a resend that wasn't
> picked up when sent to the lists in August 2021.
> 
> [...]

Applied, thanks!

[10/10] arm64: dts: qcom: sm6350: Fix validation errors
        commit: f56498fc6a9364a35dd74af791bd1251467e9cc1

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
