Return-Path: <linux-watchdog+bounces-4732-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4428ECDBE01
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Dec 2025 10:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECF033084F01
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Dec 2025 09:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828B533C522;
	Wed, 24 Dec 2025 09:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gN1gPdWo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mz2qTUbQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00A333BBCC
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 09:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569703; cv=none; b=X/q2ZK29niw7VjIwudfIxbR/pPLJUgNnMcDZBZX2j325Kd2ek9aHTtznQuudVbVP2o/K7ZirrKymSF68v9jf0GiKAciDSmvhSRX0uaiDBIK1wr+UG9H2Cm0+t81RTgf5Uwc/rdFNVm7cgwAV0yurBWCpFnN6Qq+PP3+Frj4uWEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569703; c=relaxed/simple;
	bh=J9X1qi5hRRyYs9HbzSJKYxWqI5tzHnz0FQZU7Vr0AuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VxwtIR3YnUJ8dWPfRJRjtVQn4oPGOdx+fB0z6SLNjZWNU+PzoMnWZJ9nV4FoMkgKxZYPD01Vq1jknLQa7aCl/3whE03NM78oH6BYI71xLTS9Ib+wsmRw/nO9qC9yDW3YW9U2FTxiP67LOK2jA0JXpkKxT4eDx6kp5RoXs0FQJLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gN1gPdWo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mz2qTUbQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8G1HE721258
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 09:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3s7ZB4WpT3ZfePL+kwI51x77
	h4PkbloqPerlSApHmKQ=; b=gN1gPdWom4UMdONOOB0gWLtoxNLRH2R9J9fbv/sl
	p7coDcRsOcj0bJ0Hl15VjlMwmK5ON9OOkio3D1IEwvUrW5gslC9NwNb/km24oCka
	xwDXP3jBHOrSpP9DxhoFqcpeLnB4tv3XbFFaupgE/V02idacqKLVuiDCbATA14MG
	Ue4pUSEGvMxPfzU3o0JPcTViGbDuXYLfBdejxbsse2HSM5KFs3L7W/pCi22FJv2D
	1R6SERl0ZWWdeHGBm8yD/1/TAUxiSjMcTVewAFTWFHY7NUn1byBnmrJqWDq3hExU
	fmywrg/PMdsH8RX/SMqQyaxG196gZT5W0Asywvi+huweIA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mt9ujf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 09:48:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso82519771cf.3
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 01:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766569700; x=1767174500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3s7ZB4WpT3ZfePL+kwI51x77h4PkbloqPerlSApHmKQ=;
        b=Mz2qTUbQSF4qu0xB1eJUQPnktZWwRS1HC93up6w16WydFhjmYQlkaN4jc0p7aCFR4v
         3PjRAG9SQ4+uNk4bzR9GZCdL+EJUlrc2JIPYWzAMij/yJfv/lCEd8IeqROdZU7nQ2Nxl
         gT8BwVgKXjhPAPpPiU4owWTbRwDhPEpuBrDaVGNo5I/tOlmAtG8iegiHnKUobjg+wSLQ
         0q+Scy7+qMFu1YfFkvH+32fWAUsjFBsjIwdLmauyz8PJC0g8yqzK5gqBUU1rTGZuX4JH
         9ZGbqtW2r5csjJe9cljCPGPsx+Kc+od0b57BKqkm5e9vdbCv1M5DMnotmtQIZs8L1/HE
         ol8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569700; x=1767174500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3s7ZB4WpT3ZfePL+kwI51x77h4PkbloqPerlSApHmKQ=;
        b=D5kM9sXlb5YrFUIHGgCyQmKHaRwC2SUoQnp/BU6aSZHx/Yfh4Tb5/cKYWTinjJiWRN
         A0aBFzLpWWb9/xpl1HJav59yDXOqfDBPWCoNqrcni+WgVpwJIKH9c3spXRKtzXbw66+i
         g/1ZJlh3Ek5s/U0KOJz2k5ENtxEevajKkvcRm3lKH9RZalExNG+8OdeheOawbt9Vk9K6
         2s5/Q5Om3JfR7oGzspTIR0AM1LXs6ZcfMxm6p/zGvHKOjM2L93xIV8DiWF2Pa+XUehTM
         tmZLa2hUR/Q2I3BpxaxsejolhxFJMQ5yGZdPKqIwmN4JQUaz230DDdYaMxWj6rHHGYz5
         ldSg==
X-Forwarded-Encrypted: i=1; AJvYcCUzVaFEcPXu9zwkROt0TYF783uLHedmzwGBpXbaRcDI2jBVwgjMKs+jiOdySA6dqGotpv4O/7x7qHKXcqGy+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUX6SYiMY+BRmTOSvKLY6FE/u5azNT3ZMDaWSLCPzkCPPSc0Zd
	zUrBjefAYmOSfo5g2EwakwzIdhTAS215GI39VnQe81zBjTKhvjunO6TtVq/nUioHkrdvXHinLjb
	fIzVx8RYtVTbXDgc1B7c1F+OEFxKZtV/YDxC1Mgz2ZGn/t3v3q4YSNAWkDYgB7+XOHD5ORA==
X-Gm-Gg: AY/fxX4V5N8teYV1Jf1AyGICnmV4JJ+kM5JDDVuLtKUXzjnPvSIaEbftZ7S+yz/3248
	bRrt8bFsXFWAKgUYIU1Lg0Fcev92DB8x9epFJPJcHIY5RD+dKzEbv7LwoPBhvX/jqo9OWw49Nty
	KatKybu0EI8RzZo1Ph8CyWR5362GwYbn87Rhv34hUXG6BKGaeZqa5tWjGmcEWbgwIEaYHwYj+IK
	duz3A+ROqHSBdJeXXjz4FFd71UCO/b0NCR7VimXKi/dcFX6BVnvCx7dakpyzU9ryq/uM2n2dhO+
	mMUYFrKggiiVTwFeDV2KVb/1gnNRSqRzYidCPFCRwqy3gbZXScTtodWXYXzonDSoS3DvPq2x4M5
	I2Z0U3LPJuYQB4dsaSQo8ww==
X-Received: by 2002:ac8:5812:0:b0:4ee:19d6:fade with SMTP id d75a77b69052e-4f4abcb55a8mr240164741cf.9.1766569699868;
        Wed, 24 Dec 2025 01:48:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIZvh31HNz2MlQoIcc8fdSCOaP+i3FWMOMmVlXxnGc16Xj4nFLNN5SduDu5T6Lqlja8awHYg==
X-Received: by 2002:ac8:5812:0:b0:4ee:19d6:fade with SMTP id d75a77b69052e-4f4abcb55a8mr240164411cf.9.1766569699154;
        Wed, 24 Dec 2025 01:48:19 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8056ff4925sm1262916266b.31.2025.12.24.01.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:48:18 -0800 (PST)
Date: Wed, 24 Dec 2025 11:48:16 +0200
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
Message-ID: <d4o6j5sxlpyggvbeifjmctjvxsvvmntkyrv4qybb6rgwgv75kg@hdwrecjykb3j>
References: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
 <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-2-fdfc6ba663e6@oss.qualcomm.com>
 <3fcd274f-2502-4b3b-8a39-daf5e1938bed@oss.qualcomm.com>
 <ms4r24li6bk3dvyjas5sor442jvkptz55yisdnaco6qdsyvsda@dt4lv3t366cg>
 <700e0aa1-2ac1-4829-9469-0179511982e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <700e0aa1-2ac1-4829-9469-0179511982e8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694bb6e4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fGCS0oAZma9vGdrZDLwA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: se8C0-SuIUZ5LACXPZVGOPVA1maNSJeE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MyBTYWx0ZWRfX+8YUUk0g7d58
 BaaKqwV2vDppf9qewyaJ0M4b/Fuzc1QwxrZM+uyekaMaEK8jdBovyBjOPNMGAIVTHhXizc7mjVk
 VPCs704RC9eIapkbGhku6wxkk24hPwVzsQi4oCvhlrDBZ3Z6ZRAtg3hDndEryKhXY72NwvpYNkI
 9w3R4UrJnjxtBzJIYBLi0opYowFozfs7CBJSEL3VuWR3fcEcvqqur1uWLZhXI9YG7WnHHsuxjo8
 w27TWhJ4qWqKaaZMI/dOxr+oqBCh6gsl/yO/g3+ivsrJbVOl/wRnOkVger/oxohCQ8gjz602vWZ
 fq79s2EJXsY3T2TVvAjwSzoifLGoy/MXzp2a9631QLmnoaSgHhDClF1YymvbR5kcAMratOo5ZmW
 LOpHgg83gvFU0e8pOV27DsDeE6pFdqyTKapInrCZhJfU/9RmlrJY0ClBqz5REsOR7zmyloci2Wu
 kcDOsfuACqzYiTd3ROA==
X-Proofpoint-ORIG-GUID: se8C0-SuIUZ5LACXPZVGOPVA1maNSJeE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240083

On 25-12-23 18:19:50, Konrad Dybcio wrote:
> On 12/23/25 5:00 PM, Abel Vesa wrote:
> > On 25-12-19 13:15:00, Konrad Dybcio wrote:
> >> On 12/19/25 11:00 AM, Abel Vesa wrote:
> >>> The watchdog support in EL1 is SBSA compliant, handled by Gunyah
> >>> hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
> >>> block, same as older platforms. So describe the APSS WDT node and mark
> >>> it as reserved, as it will only be enabled in EL2 overlay.
> >>>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 8 ++++++++
> >>>  1 file changed, 8 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> >>> index a17900eacb20..b65dfad71c2f 100644
> >>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> >>> @@ -8302,6 +8302,14 @@ gic_its: msi-controller@17040000 {
> >>>  			};
> >>>  		};
> >>>  
> >>> +		apss_watchdog: watchdog@17410000 {
> >>> +			compatible = "qcom,apss-wdt-x1e80100", "qcom,kpss-wdt";
> >>> +			reg = <0x0 0x17410000 0x0 0x1000>;
> >>> +			clocks = <&sleep_clk>;
> >>> +			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
> >>> +			status = "reserved"; /* Accessible in EL2 only */
> >>
> >> This is technically incorrect - it's not accessible if Gunyah is
> >> present, which is only somewhat related - if you run a different
> >> hypervisor which doesn't explicitly block access to this region, you
> >> can still access it even though Linux may be running at EL1
> > 
> > Fair enough. But in the case where you have a different hypervisor,
> > I guess the EL2 dtso should be used.
> > 
> > So, since AFAIK all devices come with Gunyah by default, it makes sense
> > to mark it as reserved (or disable it otherwise) and then enable it in EL2
> > dtso.
> 
> I'm just stingy about the wording. Perhaps:
> 
> status = "reserved"; /* Reserved by Gunyah */
> 
> ?

Sure, will do.

> 
> The patch looks good otherwise
> 
> Konrad

Thanks for reviewing,
Abel

