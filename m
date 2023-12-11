Return-Path: <linux-watchdog+bounces-260-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 427CD80DE5D
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 23:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F063428254C
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 22:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4A155C10;
	Mon, 11 Dec 2023 22:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pv2MtWby"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B11C3BE
	for <linux-watchdog@vger.kernel.org>; Mon, 11 Dec 2023 14:38:23 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-35d67870032so32673545ab.2
        for <linux-watchdog@vger.kernel.org>; Mon, 11 Dec 2023 14:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702334303; x=1702939103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY7M7VI0b23VfSNBUphc5DNOoLaA5qEDPHAJE+WTF1M=;
        b=pv2MtWbyPmwV1gTpFCd3BOxDr5FX6pBQ68KiN4ObAOeXJUdwermojbFUDT4wpk6/58
         u68G6XLXzAo5h9epk8xJ6IlYRJmWXXcKiBZzHBX6K8K7BmCDkCkXeFOpXZr6aG2XUP9z
         f48+9JQFgkgIE9YTdNVasGJbwvGf38RW6BireHIJTz54cFoZ7GM/d//wJgEVxsnuudqJ
         Mdfi9zfwGFmP0fcwCKCk6wsh+dLq8YggtZmmAqanMwA+ADdRWnbXJGoonqwDYzp14goU
         PiV24JEADNlxVhce/i0yIj/1mGbw1YVgRGC9iBzTgD/rkLJig0yf3Z3bnYD/1QK9/7pH
         BnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702334303; x=1702939103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TY7M7VI0b23VfSNBUphc5DNOoLaA5qEDPHAJE+WTF1M=;
        b=RZt1qdcBFea2scJsP913KmsU34bBaF6E+3kdg1JKe7UwCKEaA2601yAcb91+F5VSTj
         tP4ouEt9eLmuH/IDSQ1KzfM4gCBeuyl4+1PwuU3bbCr3siEJvDmDN8i+CmZno47veeNU
         TECR5mYNWXFxz8sr1caYqGH3L5NEm/EF43NUpeeFIcF+93xaHFX6MI12X9KNAMLk+yWF
         48VyEzCtWFFpV75e3OoMMIWlMrgcmJU/PYLpk0xebsutaCMYpcVCDYXjIwxRRenbiOEx
         t1FJagR1D1C4FBjj+9ry3zKO2mDNzT00A6ZbJf0dJgtM1g9TByKi4kKUZQ2evyQ0HXKB
         ngDg==
X-Gm-Message-State: AOJu0YxsAKmDraKX4PM18o/IrcHU+iAI0ml8EAxXeTPmuQJIFN8LSU1I
	ny3cB5Mex2YWGp8v4N6arC5fdvSM6/etTjKRg80bAQ==
X-Google-Smtp-Source: AGHT+IF9eaWmvj4u/srhRRq9CTCdKPjk6WVZk/VKIy6O2tBvQMwItNxp5mzYuxsCWvi0j5RUPj7IVfObbPNVyCc5+Ho=
X-Received: by 2002:a05:6e02:158b:b0:35d:59a2:2ce with SMTP id
 m11-20020a056e02158b00b0035d59a202cemr9749660ilu.110.1702334302756; Mon, 11
 Dec 2023 14:38:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-7-peter.griffin@linaro.org>
In-Reply-To: <20231211162331.435900-7-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 11 Dec 2023 16:38:11 -0600
Message-ID: <CAPLW+4=ZCyyQpzt-QRVeLeORdir99e311WxoY+q1DP9GzU7s4A@mail.gmail.com>
Subject: Re: [PATCH v7 06/16] dt-bindings: clock: google,gs101: fix incorrect
 numbering and DGB suffix
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 10:24=E2=80=AFAM Peter Griffin <peter.griffin@linar=
o.org> wrote:
>
> 166 was skipped by mistake and two clocks:
> * CLK_MOUT_CMU_HSI0_USBDPDGB
> * CLK_GOUT_HSI0_USBDPDGB
>
> Have an incorrect DGB ending instead of DBG.
>
> This is an ABI break, but as the patch was only applied yesterday this
> header has never been in an actual release so it seems better to fix
> this early than ignore it.
>
> Fixes: 0a910f160638 ("dt-bindings: clock: Add Google gs101 clock manageme=
nt unit bindings")
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  include/dt-bindings/clock/google,gs101.h | 118 +++++++++++------------
>  1 file changed, 59 insertions(+), 59 deletions(-)
>
> diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindin=
gs/clock/google,gs101.h
> index 5d2c2d907a7b..9761c0b24e66 100644
> --- a/include/dt-bindings/clock/google,gs101.h
> +++ b/include/dt-bindings/clock/google,gs101.h
> @@ -59,7 +59,7 @@
>  #define CLK_MOUT_CMU_HSI0_BUS          45
>  #define CLK_MOUT_CMU_HSI0_DPGTC                46
>  #define CLK_MOUT_CMU_HSI0_USB31DRD     47
> -#define CLK_MOUT_CMU_HSI0_USBDPDGB     48
> +#define CLK_MOUT_CMU_HSI0_USBDPDBG     48
>  #define CLK_MOUT_CMU_HSI1_BUS          49
>  #define CLK_MOUT_CMU_HSI1_PCIE         50
>  #define CLK_MOUT_CMU_HSI2_BUS          51
> @@ -181,64 +181,64 @@
>  #define CLK_GOUT_BUS2_BUS              163
>  #define CLK_GOUT_CIS_CLK0              164
>  #define CLK_GOUT_CIS_CLK1              165
> -#define CLK_GOUT_CIS_CLK2              167
> -#define CLK_GOUT_CIS_CLK3              168
> -#define CLK_GOUT_CIS_CLK4              169
> -#define CLK_GOUT_CIS_CLK5              170
> -#define CLK_GOUT_CIS_CLK6              171
> -#define CLK_GOUT_CIS_CLK7              172
> -#define CLK_GOUT_CMU_BOOST             173
> -#define CLK_GOUT_CORE_BUS              174
> -#define CLK_GOUT_CPUCL0_DBG            175
> -#define CLK_GOUT_CPUCL0_SWITCH         176
> -#define CLK_GOUT_CPUCL1_SWITCH         177
> -#define CLK_GOUT_CPUCL2_SWITCH         178
> -#define CLK_GOUT_CSIS_BUS              179
> -#define CLK_GOUT_DISP_BUS              180
> -#define CLK_GOUT_DNS_BUS               181
> -#define CLK_GOUT_DPU_BUS               182
> -#define CLK_GOUT_EH_BUS                        183
> -#define CLK_GOUT_G2D_G2D               184
> -#define CLK_GOUT_G2D_MSCL              185
> -#define CLK_GOUT_G3AA_G3AA             186
> -#define CLK_GOUT_G3D_BUSD              187
> -#define CLK_GOUT_G3D_GLB               188
> -#define CLK_GOUT_G3D_SWITCH            189
> -#define CLK_GOUT_GDC_GDC0              190
> -#define CLK_GOUT_GDC_GDC1              191
> -#define CLK_GOUT_GDC_SCSC              192
> -#define CLK_GOUT_CMU_HPM               193
> -#define CLK_GOUT_HSI0_BUS              194
> -#define CLK_GOUT_HSI0_DPGTC            195
> -#define CLK_GOUT_HSI0_USB31DRD         196
> -#define CLK_GOUT_HSI0_USBDPDGB         197
> -#define CLK_GOUT_HSI1_BUS              198
> -#define CLK_GOUT_HSI1_PCIE             199
> -#define CLK_GOUT_HSI2_BUS              200
> -#define CLK_GOUT_HSI2_MMC_CARD         201
> -#define CLK_GOUT_HSI2_PCIE             202
> -#define CLK_GOUT_HSI2_UFS_EMBD         203
> -#define CLK_GOUT_IPP_BUS               204
> -#define CLK_GOUT_ITP_BUS               205
> -#define CLK_GOUT_MCSC_ITSC             206
> -#define CLK_GOUT_MCSC_MCSC             207
> -#define CLK_GOUT_MFC_MFC               208
> -#define CLK_GOUT_MIF_BUSP              209
> -#define CLK_GOUT_MISC_BUS              210
> -#define CLK_GOUT_MISC_SSS              211
> -#define CLK_GOUT_PDP_BUS               212
> -#define CLK_GOUT_PDP_VRA               213
> -#define CLK_GOUT_G3AA                  214
> -#define CLK_GOUT_PERIC0_BUS            215
> -#define CLK_GOUT_PERIC0_IP             216
> -#define CLK_GOUT_PERIC1_BUS            217
> -#define CLK_GOUT_PERIC1_IP             218
> -#define CLK_GOUT_TNR_BUS               219
> -#define CLK_GOUT_TOP_CMUREF            220
> -#define CLK_GOUT_TPU_BUS               221
> -#define CLK_GOUT_TPU_TPU               222
> -#define CLK_GOUT_TPU_TPUCTL            223
> -#define CLK_GOUT_TPU_UART              224
> +#define CLK_GOUT_CIS_CLK2              166
> +#define CLK_GOUT_CIS_CLK3              167
> +#define CLK_GOUT_CIS_CLK4              168
> +#define CLK_GOUT_CIS_CLK5              169
> +#define CLK_GOUT_CIS_CLK6              170
> +#define CLK_GOUT_CIS_CLK7              171
> +#define CLK_GOUT_CMU_BOOST             172
> +#define CLK_GOUT_CORE_BUS              173
> +#define CLK_GOUT_CPUCL0_DBG            174
> +#define CLK_GOUT_CPUCL0_SWITCH         175
> +#define CLK_GOUT_CPUCL1_SWITCH         176
> +#define CLK_GOUT_CPUCL2_SWITCH         177
> +#define CLK_GOUT_CSIS_BUS              178
> +#define CLK_GOUT_DISP_BUS              179
> +#define CLK_GOUT_DNS_BUS               180
> +#define CLK_GOUT_DPU_BUS               181
> +#define CLK_GOUT_EH_BUS                        182
> +#define CLK_GOUT_G2D_G2D               183
> +#define CLK_GOUT_G2D_MSCL              184
> +#define CLK_GOUT_G3AA_G3AA             185
> +#define CLK_GOUT_G3D_BUSD              186
> +#define CLK_GOUT_G3D_GLB               187
> +#define CLK_GOUT_G3D_SWITCH            188
> +#define CLK_GOUT_GDC_GDC0              189
> +#define CLK_GOUT_GDC_GDC1              190
> +#define CLK_GOUT_GDC_SCSC              191
> +#define CLK_GOUT_CMU_HPM               192
> +#define CLK_GOUT_HSI0_BUS              193
> +#define CLK_GOUT_HSI0_DPGTC            194
> +#define CLK_GOUT_HSI0_USB31DRD         195
> +#define CLK_GOUT_HSI0_USBDPDBG         196
> +#define CLK_GOUT_HSI1_BUS              197
> +#define CLK_GOUT_HSI1_PCIE             198
> +#define CLK_GOUT_HSI2_BUS              199
> +#define CLK_GOUT_HSI2_MMC_CARD         200
> +#define CLK_GOUT_HSI2_PCIE             201
> +#define CLK_GOUT_HSI2_UFS_EMBD         202
> +#define CLK_GOUT_IPP_BUS               203
> +#define CLK_GOUT_ITP_BUS               204
> +#define CLK_GOUT_MCSC_ITSC             205
> +#define CLK_GOUT_MCSC_MCSC             206
> +#define CLK_GOUT_MFC_MFC               207
> +#define CLK_GOUT_MIF_BUSP              208
> +#define CLK_GOUT_MISC_BUS              209
> +#define CLK_GOUT_MISC_SSS              210
> +#define CLK_GOUT_PDP_BUS               211
> +#define CLK_GOUT_PDP_VRA               212
> +#define CLK_GOUT_G3AA                  213
> +#define CLK_GOUT_PERIC0_BUS            214
> +#define CLK_GOUT_PERIC0_IP             215
> +#define CLK_GOUT_PERIC1_BUS            216
> +#define CLK_GOUT_PERIC1_IP             217
> +#define CLK_GOUT_TNR_BUS               218
> +#define CLK_GOUT_TOP_CMUREF            219
> +#define CLK_GOUT_TPU_BUS               220
> +#define CLK_GOUT_TPU_TPU               221
> +#define CLK_GOUT_TPU_TPUCTL            222
> +#define CLK_GOUT_TPU_UART              223
>
>  /* CMU_APM */
>  #define CLK_MOUT_APM_FUNC                              1
> --
> 2.43.0.472.g3155946c3a-goog
>

