Return-Path: <linux-watchdog+bounces-4729-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F2DCD9E27
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Dec 2025 17:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C34A73021690
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Dec 2025 16:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7532248B4;
	Tue, 23 Dec 2025 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nr+rp8pA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kscAUAzJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F751F9ECB
	for <linux-watchdog@vger.kernel.org>; Tue, 23 Dec 2025 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766505654; cv=none; b=jUd4lZzZ6Qa+ceLnkcmcL6+EPW0QSy9yeXi6NFo2KObcmWnnv4Kb2+i8m7CzBDAg1skJuN96d5a6XzI3X/xQi19zqYha7wXxkVZmElKpDA7N44w3zi0FDkNz3gjz5uo5Nsz0fS1CVCq3ZetP1DEuQ2NIQmNIdWCRzPBSP1bUp0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766505654; c=relaxed/simple;
	bh=U8TyQvJwYC/7ZZY+a4zcbRXifnhqatiepRyUEU83pw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIslJU8DsNpaJIodBAGz/RdDSrgaYMPr5Vq6mVNv1sFNnx6F72qDTwbqV6iIZf1R3vtbkUy+j+gynL7M2ZMe6/QCn+Rgf+uuHh97q5y/eDSaAFILupOw1ZHKpxRJn9+48vlmZC87vOM+Exw/m7DS1b99zZwlvWFR2Bb91x6g4lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nr+rp8pA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kscAUAzJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBTdJN1358168
	for <linux-watchdog@vger.kernel.org>; Tue, 23 Dec 2025 16:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wf4+CwSpKPc/Y1J8w9AFa948
	/l3Xxemy6xO0cQgHFnE=; b=Nr+rp8pAgz4bMCnFp6a3ZEv/uu3Vuq+b0FOJkKLu
	cV2tWjEdgsOS2Ooj7oYr8YiutOJa7gwZ2aiPJ8asRkz57yEchxFPKBf4N+q7cEox
	R3TXT/sL3a361EqvwB/TKuJgtckNwt1MqbaL5RgjWUzmkzWG2t66IfzKK9VnvUyV
	iGcORF+qd4NlLToBGLgKjxHgkz51wrHKs0EUdOpoqAnF1vJNpZ2x8elq1pd8lZhp
	MCfwYWI1YD5sp0xGKS66H7odmuwTFFhp6Iqro9LBTCTF3CHC694WTXe9x2QH+ZEf
	aK/R1uPlEC9XCHXCxw6SNyOgh4WIPA29JtROTikBgp2jVA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc3rt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 23 Dec 2025 16:00:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f35f31000cso72226841cf.2
        for <linux-watchdog@vger.kernel.org>; Tue, 23 Dec 2025 08:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766505652; x=1767110452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wf4+CwSpKPc/Y1J8w9AFa948/l3Xxemy6xO0cQgHFnE=;
        b=kscAUAzJ2o6NpUu31vZ9OOuxQ0b9Qr4yHAp0pCLSyMjxZ5c8eLvGrc6Lpk/BUZosrQ
         /70dpmC3H+8Bu6EsbKlCPtzuZ1ZMCiVxcdBe0c3epnR3R0LV383ONXmEfFYMx3+NUDfJ
         LZheAVXgYxb4mjuBewJBG/X4QnD4PxNtSsDdORiUdwrfc5bNyZjvbU/pcVGt7e46frpx
         zVorWWHpHpEU8pLw0Ef2/Sd51rF1jdsVT2J1ieK9QUrfzUVcA6UXMAbwWAnnd4+KG4Zt
         s4YAH/CsOcYpIpPzJmaISuKo9YjdTqXsHlTN5+KuY3QU66Y7DbpAErTVmYTeoEjA6k/j
         swYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766505652; x=1767110452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wf4+CwSpKPc/Y1J8w9AFa948/l3Xxemy6xO0cQgHFnE=;
        b=aeWYkk6DSeoOZGNHCbxCc1S2AXUgx/Q/wvGPDsV8tUVAF8bH1XYB9KQQ41BC/IXAdn
         +bMpPfHTiwSIueUQPGZOIeniHGTqoFG0oNH7E3yFcknJ7S8y7vv8MsrEIAx5gCup3cnu
         VIZZXDow8C2B8PEPI3KvtU0GauXGUQe+ZEMUhQ/GaBsMi4O3tlziYCvvLorQ0Iq09dX8
         nqTpt6/jPjFuNiqZcq9DzDFhs+dz1oRWdqhSobxvXhuwFLyIFjFJvfdirac9zCdqSwLY
         TPa+dNE2BjnFX/FVsDu3NKbqqB33kLwU588n8h9Z7MxLqVhs00hAnycTFjXg3/pmFHUb
         jNug==
X-Forwarded-Encrypted: i=1; AJvYcCVfd+hAoYkede7YZcLSUtnboUvA5PTycfX7jiGqsXFi/fJ65frb8yP5RB8KiCkre8V6/5HE/uYl9m19cykovA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKPKqUEWkflujHxS2knuoc1ayDB1pwP4DVLPzdXz9m+I39eYVU
	wNEY+2wtFuF9kNcROYkp1m7EbP9ytRFSABGnxrEk/tt4KbthbBJ+ZXE925IqwnnuI7ZhvEv3A2Y
	dPNtJSKjQbc6kWCITYkKLGdY0LtZpzpBHWeQ7OWQ3S4v7Ujd+oI35kMoxeC5kK0UiYO2Wvw==
X-Gm-Gg: AY/fxX6SOYgC5vLn8TQZCFtoMDL2NzHvZRfDz4TDFJhpE1zW0mhGcbNOAJ1sOg1ug9r
	RbAxyYNziig0SDDhBk07NHfO1sFsyONsUYd4Z90gNa66AO1DA2zL3Eg83PnDaZjQ8OlgkZQQNNn
	nR1FiD1NduKnpfntssmoiPRva7yAae2jhP00Uft4X9WOb92yPN2LWa14b7Pj0AR3+g4bW3JWVEH
	PVcscUNem6ETCLOcTJaB4yg94v/0ccUPq4+7YRCgcyBI03ZWRSmwvnaShcCbTazN36ETscwxUyF
	2EfiwPAlsgmRSVR5yc9GG0VSQIA3/FMPcsYT0nFrzu5l6tF6gKeTO8gRqwmsK4Ehm0HM2XSNgqT
	3C7ZPGfjhmOinHSbheYGJRA==
X-Received: by 2002:a05:622a:a0f:b0:4f1:e9f7:4dee with SMTP id d75a77b69052e-4f4abcf9043mr220380091cf.35.1766505651313;
        Tue, 23 Dec 2025 08:00:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUQ9NfH2NQZJU7mtYDnuzRK+AhPP9tE6G7iactVTrFhz+atWa4wjO4IKj78Me53QYltT7HqA==
X-Received: by 2002:a05:622a:a0f:b0:4f1:e9f7:4dee with SMTP id d75a77b69052e-4f4abcf9043mr220378431cf.35.1766505650368;
        Tue, 23 Dec 2025 08:00:50 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm14276727a12.31.2025.12.23.08.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 08:00:49 -0800 (PST)
Date: Tue, 23 Dec 2025 18:00:48 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: hamoa: Add the APSS watchdog
Message-ID: <ms4r24li6bk3dvyjas5sor442jvkptz55yisdnaco6qdsyvsda@dt4lv3t366cg>
References: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
 <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-2-fdfc6ba663e6@oss.qualcomm.com>
 <3fcd274f-2502-4b3b-8a39-daf5e1938bed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fcd274f-2502-4b3b-8a39-daf5e1938bed@oss.qualcomm.com>
X-Proofpoint-GUID: -3iIICqzeefBTP9-1fr0M9DTYwLxbLAv
X-Proofpoint-ORIG-GUID: -3iIICqzeefBTP9-1fr0M9DTYwLxbLAv
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694abcb4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zMAY4Xzx9T0OtoEEl6MA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEzMiBTYWx0ZWRfX1P+lMaxsl2RO
 yUVPgUESn4FGjIahzl7qRrIjH1RDRd02TFztnJLmmNJEgnQWsgcNqnMiwBP6QiiZoNdrmHTX9gc
 L/bVGL6BVbSi/SgrL9Iyf01ZWluF163X5HdV+V5YRGyY43JkkSb52LXn1rCtStpwVx3NceYiHXv
 D8mWyAKb6efPUEp12UttJrN6AygTDHNvaJDEUkbY/Jzw0wOeJmoxchf7Z1j7DY+X/NXS2Wilo4W
 tgVSfSYLvStWOitjQSRQ/sTvFt1PS32+MopdZcsVZqZDMTNRnuhCedspsxdAxPHMkXiFpp6mfC/
 anh6d4+iGquD50PT3f+tBCF21PupUwwxdHUwY+F7WPkHwe/woMDrA9+TM/lDLXTtTussffRh/Ai
 Hqgzs0O/5JmhqgnWddSo3ERTIwlg9+KtsC1zxK12Mt1CDdpfoOxWiHfAYDGLygIDHeJGqwIw5Rc
 zpcMSnnjiVARWPPTqZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230132

On 25-12-19 13:15:00, Konrad Dybcio wrote:
> On 12/19/25 11:00 AM, Abel Vesa wrote:
> > The watchdog support in EL1 is SBSA compliant, handled by Gunyah
> > hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
> > block, same as older platforms. So describe the APSS WDT node and mark
> > it as reserved, as it will only be enabled in EL2 overlay.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/hamoa.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > index a17900eacb20..b65dfad71c2f 100644
> > --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > @@ -8302,6 +8302,14 @@ gic_its: msi-controller@17040000 {
> >  			};
> >  		};
> >  
> > +		apss_watchdog: watchdog@17410000 {
> > +			compatible = "qcom,apss-wdt-x1e80100", "qcom,kpss-wdt";
> > +			reg = <0x0 0x17410000 0x0 0x1000>;
> > +			clocks = <&sleep_clk>;
> > +			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
> > +			status = "reserved"; /* Accessible in EL2 only */
> 
> This is technically incorrect - it's not accessible if Gunyah is
> present, which is only somewhat related - if you run a different
> hypervisor which doesn't explicitly block access to this region, you
> can still access it even though Linux may be running at EL1

Fair enough. But in the case where you have a different hypervisor,
I guess the EL2 dtso should be used.

So, since AFAIK all devices come with Gunyah by default, it makes sense
to mark it as reserved (or disable it otherwise) and then enable it in EL2
dtso.

