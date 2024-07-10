Return-Path: <linux-watchdog+bounces-1346-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7746A92CC1D
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Jul 2024 09:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 327462814E9
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Jul 2024 07:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101D882D9A;
	Wed, 10 Jul 2024 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VeoXg4W4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3724184E0A
	for <linux-watchdog@vger.kernel.org>; Wed, 10 Jul 2024 07:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720597284; cv=none; b=bcIRp0cODgjn0cPXMEP78JmG8QweenPTEsILy0FUkntPyF+Sn/fcB4THHMTJatV85CxBLJgF8zXx7/ugJkNp202RY0TIZAn+oQAOOyOZaxe1O4ZjdkOet0tHbpQoLewhcACeq/dNs/NDNqVFJ3/tklT4Y1e3c0UQc7DQMPkoJd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720597284; c=relaxed/simple;
	bh=iEHxw5tXRJLGL3KYGKBlQ7KWX//I7Sr6DC/FLj3/AAw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HAe6OF6kDzpn8XqacmMa1w6jPR6OCG1tHDgWUbU2WbTWH7WTJx2LO1f6DISWkwRqUWUT9NT6yHkOl+PebRHTufkXk9cyJr3XMiN32qaQ4I9r8FeLQECtyqjCxggnktu5NH0/GSyFgv3rgKKNhskEIRGYu7JWFDT0ZE6t/SEAZb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VeoXg4W4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-367a23462e6so3579629f8f.3
        for <linux-watchdog@vger.kernel.org>; Wed, 10 Jul 2024 00:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720597280; x=1721202080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsKkA5+o8cIHzcUHIp0+w252IM0bp/4uWhC5/Umf21Q=;
        b=VeoXg4W4lUkS4S7WFJQoDk73ONVFFacUc+0He+Bi5g9JI5ok3IKQZt8HxbPGze/FsG
         TWnTiTftD5tm0VOp0HEzLYwooSWu3pyuBilQX8k8tPODzzDVT+4wJfXFSAUyUqttaizI
         ZVo7kxyZqT9x/iQhC/rSboEqfWnJX+e2QJ3OPfBVoLQhOQj8rLg9vDPeIFG3N3+uMWeX
         7Z0v0g+wth/DRIn6DvzXVWOpQtlj2PtX2vfMz2RmxkYBssjGDFZvqv/4eZereWNGBObm
         yyCPnu8xLEGs0ksrboo60VYPSuD8vU6Py+1++hauuBJi+avnZrPXMfV3S9ArE9TFp5b+
         x2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720597280; x=1721202080;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsKkA5+o8cIHzcUHIp0+w252IM0bp/4uWhC5/Umf21Q=;
        b=e6dg7IxQD+XO2EvE+jJ3W3lsPWETjy7sacugtrrXRhgw8ixfnUqvdKpjkSBuDewzGg
         dJ0lfKak7sDg3058J5dhVNPsL4HeitLJQ6Cm7yxVft6UGHp7p8fvIZC3MO6FmjP8pErG
         TBa8IYRM6RKRd2D/fhp2iwMQ3cH5pJJ5C97FQkS3FamrKCcnifAeQ0BW9aJIQ+7x5kLQ
         UCmF2nPoZRaG53K/KuLIyhyMvUFqnUKCNaJUdAZnlz20qZtrqFAOzM4dMlRST+qjM7it
         oaRq42klTTm0weEpL0qg81oQRnyyEW5ERVnUt6BqkFVccsAy4+aRyx1l2437rCvxCvy5
         zKuA==
X-Gm-Message-State: AOJu0YwPTwNIETie1efymSVJVxfCOWM2Fe66w9cjUiG2aC9HC80N6Sai
	KW5vo2GsyzowZ460F95abTIqZugoYT7wrB7mAoj7aIz2v8T6LWAPA0XQah6Nej4=
X-Google-Smtp-Source: AGHT+IGddrOSocTC3Aibp1Vkqu1Aje6/Ock0VDU/08zMxBW1iObesEMZ5KiX9KO+LVhFoCxjz3qx8g==
X-Received: by 2002:a05:6000:2cb:b0:367:9088:fecd with SMTP id ffacd0b85a97d-367cea46e00mr4261777f8f.7.1720597280243;
        Wed, 10 Jul 2024 00:41:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7e095sm4527144f8f.23.2024.07.10.00.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 00:41:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Huqiang Qin <huqiang.qin@amlogic.com>
In-Reply-To: <20240709-a4-a5_watchdog-v1-0-2ae852e05ec2@amlogic.com>
References: <20240709-a4-a5_watchdog-v1-0-2ae852e05ec2@amlogic.com>
Subject: Re: (subset) [PATCH 0/2] Watchdog: support for Amlogic SoC A4/A5
Message-Id: <172059727940.1289531.15312201454629239383.b4-ty@linaro.org>
Date: Wed, 10 Jul 2024 09:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

Hi,

On Tue, 09 Jul 2024 16:48:24 +0800, Xianwei Zhao wrote:
> Add watchdog for Amlogic A4/A5 SoC.
> A5's watchdog is the same as A4's.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[2/2] arm64: dts: amlogic: add watchdog node for A4 SoCs
      https://git.kernel.org/amlogic/c/34b60b78550eedbb596274f0336d1f86a80fcd19

These changes has been applied on the intermediate git tree [1].

The v6.11/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


