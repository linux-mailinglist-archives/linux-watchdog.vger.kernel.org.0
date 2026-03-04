Return-Path: <linux-watchdog+bounces-5060-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KM6Cen1p2lFnAAAu9opvQ
	(envelope-from <linux-watchdog+bounces-5060-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 04 Mar 2026 10:05:45 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3431FD2B0
	for <lists+linux-watchdog@lfdr.de>; Wed, 04 Mar 2026 10:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B89BC3048C9E
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Mar 2026 09:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220A6396571;
	Wed,  4 Mar 2026 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KM1nxb8a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSdBvOcq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3474C37F745
	for <linux-watchdog@vger.kernel.org>; Wed,  4 Mar 2026 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615007; cv=none; b=aOT+d0rtHfyfAT26SGBWtdj1G6mcPHejcn7qsFeu/V8aNz2rXsjIMdy/W8jYTSQWdkFSjda4khB31Ud2b/kXhKr1hBBULX9JWrAmEwpAi72wzxW7AdjASri3vwXEtAQejlEnBMtysE39IBEywFLRklOokXP9jJrgMYzLvkUOarc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615007; c=relaxed/simple;
	bh=esqrcU2iBVY8ci/hzt1UovcnezFcilbxILgA7vFytvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HmlAt12kNm4A6uUgPrGxtT34Sb9RYs972xWQp+vQlDxmpKP5hd+nISgYhV7ZA//Pw5RuZQAYQRhi4VpLikBtC2XlCH98uZVdi80V7bajzUVympaVGFm9CNtGNRxOZiX9+isKaRUgWl/bD+ZNyHIu8nu8IoUEWRb2HgTcfuJuZHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KM1nxb8a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSdBvOcq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246D6IW1203226
	for <linux-watchdog@vger.kernel.org>; Wed, 4 Mar 2026 09:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=; b=KM1nxb8aj0tWlKAq
	b52Nx7se77o3CBamhSkfMSBNL/LoHsX6BkUJw8XnmD1Hk32c0FZXccAxHNksV1kf
	fNRo/k1ZAt3VNvk16Evg4xhW52CXIfNhQiqDirLYASsnk31X4aLnKZmGdfZypEwU
	YUXXRyyM6MQxSqtbgN01xRiU7PnUPmyqJNjLj3J8QnRYxDI7QOvrOQ2ZkNSAKCtM
	a7lNFKTSwcYExx9osupgM7HO+JzSxfF+A/fFW5Vyyx+qhBCGWyYkzfftDhOr+6xh
	iSCVrsUVqMbrd409to0DbK/MIt8YJrf7MQPa/SWIJn40kd+UAL3tUJrNjzQTJDaI
	g5mi2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c0juc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 04 Mar 2026 09:03:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3a2eb984so4787175885a.0
        for <linux-watchdog@vger.kernel.org>; Wed, 04 Mar 2026 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615005; x=1773219805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=;
        b=bSdBvOcqWbeABc8e5vQbfAvAAEkZYQNGAFrYXSYt2MIMOh0+PndbaqWWHcEw3CzWwl
         jsdi0kYg/mElKvRtYwkzgUShwPpQqVuIGDKpz5Le2w0L8sR4LdiPcGljrTd/jQPUcZGw
         BWX2sEUV6II2MV2VF94551s5e6uMiRtiQwOvAz+inSZ613o08RZDI/9rv4Ju+JbbS0R5
         bo7miyFaSSuM3yICPV2seWTT3Nf2VzRnp0x8n+XpGUBxC97epcEkNpUJ5rCSgZDYpsce
         JGSgHlzAI2mtVT8QzIzqYUZSfWo59JV1YsL80H/z6GP1BhCpYAbHjCUs3igf0n6TLufm
         dqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615005; x=1773219805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=;
        b=PB4YrKm98MstoG3xEKDazao/QJwYjATM+ZzqkacIZlS5vHqJT+jr7wCdNKeiOmM8bm
         m82yBdGKoL3j9txMZc/CdcyG2AacKZ+i15UvKtbjFHL1vZrGoMQ3EqCBn49W/Z7kPaIY
         XJp1unGM4h9IdDRf2E2d/xyJgF3hPe/ai0FKdN2MmUTco/VETm+WkO/lfRYwPcqvwwgf
         h/RH4q0eGt+K213dwtojFspzIw/HokqSoXK2cB0PsmlCNJBm6wSn0M+K+qWxpTtTykXY
         RpVy6uqQ6rFdVVwh1r35EifnKF6E+L1gGWCtb+hfD5a/PQ7T/RSHO2Di7l7VBvyPSdpD
         XZ0A==
X-Forwarded-Encrypted: i=1; AJvYcCWZcYYpnP7JqFALqRGi10ctl+ZMin0sphJRviA1QkwgGtZkxSLggJtp4VjclSDFFj82LArlvxI3ATjFPXmkSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdMM4F1Q1QFPIf5qS8gGSD7VcimlP0G6I/TM5rXOjdbiCSrI8R
	OdRrQGcDakojZV6m4imabXFbysAQNwP4rniHdALJRl7plk6FHn7dVvRlbo7VcrTyZ53sBz6dnZ5
	dAILx2sVw4FGDFS6Qr7ujtQz/le8fSTDsDJw733tS7oxf31bR0xyUO/qMf4BT58+L+9s4sA==
X-Gm-Gg: ATEYQzxpnKfa2W5n4qgNt17swRc4Y45lb0KHKYArLO9gUUYRK+3pTYW8c5CDnrHZHms
	CGtDXpvZdn+HZUrN1Vr3wnINZIIGPmlPdDSnlvRtRm14EL/N2PbTW+yDkAlElWG2hc3lVI/aM/a
	Ljw2FtgwQBZJYOc4xMpLPToFiJriBP/EuTx5b3qHC2Z4UL6ZMmS5ngRWxrZnX3NLyXFfgQ16nV4
	JirTDrAyWC0ZHyUZCCvltmCkjLYK/jyl3Z3rY7ud/5vOH9Hp0kjYQWw9hTY62WHqr5G4AEyFjV6
	ZVo0jFukJ8fnxLAo2tb+ywdlmRrMpYkwr6miXp96jARGPfwkzaz69ttK0Fo0+zTp6inj7VuYkND
	iyTjMkiPJTE9yvuLL5iH34tKGLe61djhqjRKpJgX1X1KLcydjXGqN
X-Received: by 2002:a05:620a:2a11:b0:8ca:2e37:ad07 with SMTP id af79cd13be357-8cd5aedc525mr148298685a.8.1772615004765;
        Wed, 04 Mar 2026 01:03:24 -0800 (PST)
X-Received: by 2002:a05:620a:2a11:b0:8ca:2e37:ad07 with SMTP id af79cd13be357-8cd5aedc525mr148296585a.8.1772615004301;
        Wed, 04 Mar 2026 01:03:24 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:29 +0100
Subject: [PATCH 08/14] leds: Kconfig: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-8-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=808;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=esqrcU2iBVY8ci/hzt1UovcnezFcilbxILgA7vFytvo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UyednvCwSCoZ+nWGbhEbuv0oD/DsD+ub+SH
 Bayu8pZbRSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1MgAKCRAFnS7L/zaE
 w1PEEACFpMfWSUuL7d1juKi1HvQOLE5EdxG8E6A4QaKtXdS3ANVfIy0qrGuEIUQXgicbWadwYfl
 OaTottfXrufEJmdI0fv5wm/Ba0Ce+dGauXb9LT3oWERf8IIESub3fSBxQR47tJ3RvMiImrdQvVN
 kKc/LD7R2+gjpCuPPTddvQZJ0tlkKy8e1ZTmaa/hkzkJ94XaN9nPnEIdFCu9Kr62779GyMchvXx
 BxRd++vsdgYSwLCw/buTmw5zNTr370yDqP+1qH+rVjMxtfO9Zw8zkY6hmSt2xTXNEqu7awNMt87
 y9s51NYMLEt/5kNRRBWwiQXOTueyUnFLcKDvppzruElRsoI/mAX658xGSGoP67hp+abb3nb6OLi
 JL4vTng9bv5lINhV3xT8Atk3VZh7t7iysgSY7rfnm/j5+USEIwNtWYLtSKS/Joc6vNav3MgRLhO
 4LmEv8gppfOWfvU+papRncEUoxZKfsuyg5JDM3qszyQdUxzbvR7uaaxIY92hvizidXOfkzZHiUm
 xis1G8tdtqLlUrRO525gB+cnSkXockjuD9cvWhGSr90WATkl8RtxCNSTacO8tjTGK7UiE0PavPA
 wmJlJkD5UNPd6btvf4QqiFjWdL6XosBMIn6BtwfkGMIKJS7BPu0sIS693sDZqL7tU3J1U4xbUVW
 GuGQMI9pJeVyrkQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX9PAieCq+5BEb
 BK+vdH6C/bLC+Kt9sGWfGGsbb5sYMiE1t0gFP2SCXvbU0lxTb2OkodUgC1kod/0Q+JmhSH1ZeBG
 dgsvpGSBgG/XKx7xR4E+27II/6WhWGWGTebUElgitLeKWuQK14br7WT3k2dGdzfRCjZdIeeZhrb
 l61Q9OcgQCZh5mKJTaX9mU2qCN0Qe4kGOsb3/UprVN/sIBzhIxyTsQjKh9ZYwkSX81+8BpRB8TQ
 0Wr+sPLE/7o74SSa8doNA3+vQdzNS6Mmd+1JbwHNGzn0bxd10WqAXXOPE07n7e5cUWpn+TY7cm1
 ONjtCJEDHmbcme6uHynUjE4pfa4K9WWYuqzi2S+5dj0J2thgVbU+dODoCZFFMLTM4nLaRjqxUlI
 zbJ4OOOktmw4nLYlQo/xMSlJvArU8upZ37q4QOg/HDTSMGEO1H95yzV9Wj5X5I4qBQ2BRzLv01M
 kCUiMrezOx0uDzqQ3Tw==
X-Proofpoint-GUID: smftStgqEyUjdMLchvH8Rs4T_agfSof9
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a7f55d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ULgK7OEL32dECu8VbM0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: smftStgqEyUjdMLchvH8Rs4T_agfSof9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-Rspamd-Queue-Id: 5E3431FD2B0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5060-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,synopsys.com,buserror.net,linux.ibm.com,ellerman.id.au,gmail.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,baylibre.com,googlemail.com,tibbo.com,roeck-us.net,linux-watchdog.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/leds/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 597d7a79c988b35f304e953e873af3afe2ae04b8..f4a0a3c8c8705e0f10ba26584277dbb2d5eac5b5 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -765,7 +765,6 @@ config LEDS_NETXBIG
 	tristate "LED support for Big Network series LEDs"
 	depends on LEDS_CLASS
 	depends on MACH_KIRKWOOD || COMPILE_TEST
-	depends on OF_GPIO
 	default MACH_KIRKWOOD
 	help
 	  This option enables support for LEDs found on the LaCie 2Big

-- 
2.47.3


