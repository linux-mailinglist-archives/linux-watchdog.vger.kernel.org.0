Return-Path: <linux-watchdog+bounces-4605-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC4BC64B0B
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Nov 2025 15:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id EB09F23EBF
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Nov 2025 14:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DCE33557E;
	Mon, 17 Nov 2025 14:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ilgPcbIh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A549334681
	for <linux-watchdog@vger.kernel.org>; Mon, 17 Nov 2025 14:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763390737; cv=none; b=KiMjSOOBhUexHwLZqx4jYtG2qmfGx1AbUGVt9xtM9ne+Ngunkg9j7XaH8y3B6LtigP3tZ8WVqNRaM1fzRxLMvEznArcGmDWML12o/7p9GKl7myRnSqm5buNv1AMMMepNRbNeh613lx8J9EZBnn7A4v1GUvC4rYwQazXrXDN4zpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763390737; c=relaxed/simple;
	bh=Q6zm4hF/iuyshuI8ZTVRPYLVS9bhIMvZAtEoGBwphH8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FUvggTyPh8jR8TuiCLt7NKulUYB38fOqc1RdLdUeM4IENAFAk14LTu9J6XCGWApnQqMzeUqCPv12UkJgs5ECPESI7GscAUqJGYhZYaIHWaAb6yyM4di4I4ebN19zduyXih5g2AMpiJg1E59/d59fcjJLQ1T6GshJzYFbdWyfsxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ilgPcbIh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so14987145e9.2
        for <linux-watchdog@vger.kernel.org>; Mon, 17 Nov 2025 06:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763390733; x=1763995533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tk1rjAouZOijY60x5awEeFZKndj7NK9f5IbkSRl7Hig=;
        b=ilgPcbIhX64PZXxn2qgIjAK8KupZkkjeaBdC6GnUi9CDSeTkOFM+VL63LkVDzmzQOF
         HfR0lXyqfRZcRv+hM9OkgVfZ5kpyeSJglbL+5X2hlKO4znxkZv0AYiOWyFGIULeU/UH6
         is/BoMcuP+5Ja+/5On3a/KGXiff3Fi6iLjYYUUZUbS7S8QjZUcG+N8D5BPN0K20DUFTR
         c99Oqyc/jWpA+6i2brxgZ6PvXeMaHs2/4DgQtlwrQEZlxtqYy1YwO7+VKedqWBiCY79u
         onCPY3LcDjM6rB7zW5bxdMiELWCdD8oFHGDjDOG906yThOE+ftsqWw0ZPA2MR3ddN2qD
         HIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390733; x=1763995533;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tk1rjAouZOijY60x5awEeFZKndj7NK9f5IbkSRl7Hig=;
        b=IUAYRbvsW/JTrE0j8NkX9sHZrQ14iruEW1WyzswMYX9zH+pT94lOR8BCojpmyr2RJo
         MK0eubqNEKjSOfvFIZTae1vmabLyqh3QaCCkFndSf3ey+Kt1zbHqGCOy2sGb5OV8tdXL
         W9K5VmYtkghJgYfNbVjT+S9ekXoJdGUVcoZaOc8f7OKgpQCREHZjKu/MWvbdkHIw+N6u
         9BiSwXCcxxigK62fRjI7+PLg9A4nTJpcxX1DSCyhenOStoeIE7Wr3PNiAzuGA/ZfQG9a
         qdSgNmr09oK9tdR0NUI+ww1JzdHu2rWMTmpZD8AZcgbSEfcRFTkoojh80ygXYMNgavq4
         +rYA==
X-Forwarded-Encrypted: i=1; AJvYcCXoLlLIm8gzGYzquqGoZRrwtXNx5V7+2NfO+TQ2tt6rQVPPGxFWm6l2ImnN61VqfELBSv+Rnt2Wacw4Kqwdow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdZXGdwn9KEI+vvPKnoVE30gSY0E+dEKCKAu04+SUUpEkqsch7
	wQ8MWxc8L9WZ89RLh54zS5jH2AO/Xs7mLyHxkpuXDbj81WLnALC4Rhp7RQRuH/6j6Lc=
X-Gm-Gg: ASbGncvwhaWbEyCy4eXhrhuVy0FXrIWN38kMiGgZPtKn6Y18mHaecYiMTv+DneLf/10
	rzdkwzVyLHK83JoAaymdCePGNZMj0ngf3I2OD9LkMl+LfFRsrO1265tzgRJ6qqIzvb+h4nmk7qs
	M+sXAYQ79FBJwsJbpC48sdRVwmkKSumXLab3/nuV1WhsiocEZjLLzD/FaXNjKjpSfBm0Ly9JEkI
	lSeegpFv/IhsgeYaMG0i4Y7w7iP+L5ftCoMS1nrdij1rL1AsTKKnHKnN972UIU6M6NyebZWumzA
	QXXB9UNlRWnCZOTDo6bbKtvB9pDsTY1UI8VHeqZLMeGCizaZYpYZLwnhzTtY6tRnw/ABjigNVzS
	N7NHXDVTi+zY4P3iOCb1jXI9FlP4P0obFhMzs40tXrWcpf50EiwiWQ8krq1UrbovZCgkMQ2zNi0
	N+9eWrGoZF5O3ObDc5th0eS6A4WAcs6wgASNNvQ71nFkz3xvV1kBk3EP6uEBy5Q0g=
X-Google-Smtp-Source: AGHT+IGlg72HMQBd44oB2inZGPtEY6S/5RoSqJOOvYSdU1XD8940TN5ihG3EtEkhqdXoOuWUP9+0Hw==
X-Received: by 2002:a05:600c:c177:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-4778fe683d6mr111222665e9.13.1763390733101;
        Mon, 17 Nov 2025 06:45:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d631:aa74:9313:e9f3? ([2a01:e0a:3d9:2080:d631:aa74:9313:e9f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779920f2cdsm154148925e9.10.2025.11.17.06.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 06:45:32 -0800 (PST)
Message-ID: <168374f9-cf03-481b-b4b2-ed51787a3def@linaro.org>
Date: Mon, 17 Nov 2025 15:45:31 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 0/2] Add support for Gunyah Watchdog
To: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251114-gunyah_watchdog-v7-0-f5c155b941d5@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20251114-gunyah_watchdog-v7-0-f5c155b941d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/25 08:57, Hrishabh Rajput via B4 Relay wrote:
> Gunyah is a Type-I hypervisor which was introduced in the patch series
> [1]. It is an open source hypervisor. The source repo is available at
> [2].
> 
> The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
> access the MMIO watchdog. It either provides the fully emulated MMIO
> based watchdog interface or the SMC-based watchdog interface depending
> on the hypervisor configuration.
> The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
> version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
> 
> This patch series adds support for the SMC-based watchdog interface
> provided by the Gunyah Hypervisor.
> 
> This series is tested on SM8750 platform.
> 
> [1]
> https://lore.kernel.org/all/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/
> 
> [2]
> https://github.com/quic/gunyah-hypervisor
> 
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
> Changes in v7:
> - Convert local `const` arrays to `static const` to optimize
>    initialization and stack allocation.
> - Link to v6: https://lore.kernel.org/r/20251112-gunyah_watchdog-v6-0-38ad01f8dac0@oss.qualcomm.com
> 
> Changes in v6:
> - Fix build issues reported by the kernel test robot on PowerPC and RISC-V
>    architectures by adding IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY) check
>    before calling arm_smccc_hypervisor_has_uuid().
> - Link to v5: https://lore.kernel.org/r/20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com
> 
> Changes in v5:
> - Move the gunyah_wdt device registration from the SMEM driver to the
>    SCM driver. Add additional logic to check if we're running under the
>    Gunyah Hypervisor.
> - Implement .remove() for gunyah_wdt driver to make it not persistent.
> - Link to v4: https://lore.kernel.org/r/20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com
> 
> Changes in v4:
> - Move the contents of gunyah_wdt_init() to qcom_smem_probe() to make
>    sure we're registering the watchdog only on the Qualcomm devices.
> - Link to v3: https://lore.kernel.org/r/20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com
> 
> Changes in v3:
> - Move back to platform driver model. In module init, determine if we're
>    running on a Qualcomm device and there is no supported memory-mapped
>    watchdog present. Then proceed to register platform device and driver
>    for SMC-based Gunyah watchdog.
> - To determine if we're running on a Qualcomm device we're checking the
>    presence of "qcom,smem" compatible devicetree node. As an alternative,
>    we also tried using socinfo for the same purpose. When both
>    gunyah_wdt and socinfo drivers were made built-in, it couldn't be
>    ensured that the socinfo driver probed successfully before gunyah_wdt
>    init was called. Hence, we resorted to the devicetree node approach.
> - Limit the errors listed in gunyah_error to the ones that can be
>    produced by the driver.
> - Link to v2: https://lore.kernel.org/r/20251006-gunyah_watchdog-v2-1-b99d41d45450@oss.qualcomm.com
> 
> Changes in v2:
> - Move away from platform driver model since the devicetree overlay does
>    not happen by default.
>    See https://lore.kernel.org/all/91002189-9d9e-48a2-8424-c42705fed3f8@quicinc.com/
> - Only when MMIO-based watchdog device is absent in the devicetree,
>    proceed to detect SMC-based watchdog using GUNYAH_WDT_STATUS SMC and
>    initialize if SMC returns success.
> - Implement pm notifiers as gunyah_wdt is no longer a platform driver so
>    dev_pm_ops cannot be used.
> - Pretimeout IRQ is no longer supported.
> - Remove struct gunyah_wdt since it is not required.
> - Move the contents of gunyah_errno.h to gunyah_wdt.c.
> - Link to v1: https://lore.kernel.org/r/20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com
> 
> ---
> Hrishabh Rajput (2):
>        firmware: qcom: scm: Register gunyah watchdog device
>        watchdog: Add driver for Gunyah Watchdog
> 
>   MAINTAINERS                      |   1 +
>   drivers/firmware/qcom/qcom_scm.c |  53 ++++++++
>   drivers/watchdog/Kconfig         |  13 ++
>   drivers/watchdog/Makefile        |   1 +
>   drivers/watchdog/gunyah_wdt.c    | 260 +++++++++++++++++++++++++++++++++++++++
>   5 files changed, 328 insertions(+)
> ---
> base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
> change-id: 20250903-gunyah_watchdog-2d2649438e29
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

Thanks,
Neil

